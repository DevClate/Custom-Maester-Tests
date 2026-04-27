function Test-ContosoEntraLicenseUtilization {
    <#
    .SYNOPSIS
        Checks if any Microsoft 365 license SKU exceeds 95% utilization threshold
    .DESCRIPTION
        ENTRA.LC.3001 - Monitor license capacity across all SKUs to prevent business disruption from license exhaustion.
        Validates that no license SKU has consumed more than 95% of available units.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Graph)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
            return $null
        }

        # Get all subscribed SKUs (licenses) in the tenant
        $skus = Invoke-MtGraphRequest -RelativeUri "subscribedSkus" -Select "id,skuId,skuPartNumber,consumedUnits,prepaidUnits"
        
        $overUtilizedSkus = @()
        $threshold = 95

        foreach ($sku in $skus) {
            $enabledUnits = $sku.prepaidUnits.enabled
            $consumedUnits = $sku.consumedUnits
            
            # Skip SKUs with no enabled units (trials, disabled licenses)
            if ($null -eq $enabledUnits -or $enabledUnits -eq 0) {
                continue
            }

            # Calculate utilization percentage
            $utilizationPercent = [math]::Round(($consumedUnits / $enabledUnits) * 100, 2)

            # Check if utilization exceeds threshold
            if ($utilizationPercent -gt $threshold) {
                $result = $false
                
                # Add custom properties for display
                $skuWithDetails = $sku | Select-Object *, 
                    @{Name='UtilizationPercent'; Expression={$utilizationPercent}},
                    @{Name='EnabledUnits'; Expression={$enabledUnits}},
                    @{Name='AvailableUnits'; Expression={$enabledUnits - $consumedUnits}}
                
                $overUtilizedSkus += $skuWithDetails
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "✅ **Well done!** All license SKUs are below 95% utilization threshold. You have adequate license capacity."
        } else {
            $failureMessage = "❌ **Failed:** $($overUtilizedSkus.Count) license SKU(s) have exceeded 95% utilization and require immediate attention to prevent business disruption.`n`n"
            $failureMessage += "**Over-Utilized Licenses:**`n`n"
            
            foreach ($sku in $overUtilizedSkus) {
                $failureMessage += "- **$($sku.skuPartNumber)**`n"
                $failureMessage += "  - Utilization: **$($sku.UtilizationPercent)%**`n"
                $failureMessage += "  - Consumed: $($sku.consumedUnits) / $($sku.EnabledUnits) units`n"
                $failureMessage += "  - Available: $($sku.AvailableUnits) units remaining`n`n"
            }
            
            $failureMessage += "**Action Required:** Purchase additional licenses before reaching 100% utilization to prevent disruption to user provisioning."
            
            Add-MtTestResultDetail -Result $failureMessage
        }

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
