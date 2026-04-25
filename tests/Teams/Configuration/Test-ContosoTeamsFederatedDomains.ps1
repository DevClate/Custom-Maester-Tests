function Test-ContosoTeamsFederatedDomains {
    <#
    .SYNOPSIS
        Checks if Teams federation is restricted to specific domains
    .DESCRIPTION
        TEAMS.TC.5023 - Federation should be restricted to allowed domains instead of open federation to any external domain
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $federationConfig = Get-CsTenantFederationConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/external-communications"

        $allowFederatedUsers = $federationConfig.AllowFederatedUsers
        $allowedDomains = $federationConfig.AllowedDomains

        if ($allowFederatedUsers -eq $false) {
            $TestResults = "ℹ️ Federation is disabled (AllowFederatedUsers is False). This test is informational."
        } elseif ($null -eq $allowedDomains -or $allowedDomains.Count -eq 0 -or $allowedDomains.AllowedDomain.Count -eq 0) {
            $result = $false
            $TestResults = "❌ **Failed:** Federation is enabled with open federation (no domain restrictions) in [External access]($portalLink). AllowFederatedUsers is **True** with **no allowed domain list**."
        } else {
            $domainCount = $allowedDomains.AllowedDomain.Count
            $TestResults = "Well done! Federation is restricted to $domainCount allowed domain(s)."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
