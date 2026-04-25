function Test-ContosoUsersUsageLocationSet {
    <#
    .SYNOPSIS
        Checks if all Microsoft 365 users have usageLocation property set
    .DESCRIPTION
        MT.3003 - All member users must have usageLocation configured to enable license assignment
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Graph)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
            return $null
        }

        # Get all member users (excluding guests) with relevant properties
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "id,displayName,userPrincipalName,usageLocation,accountEnabled"
        
        $usersWithoutLocation = @()

        foreach ($user in $users) {
            # Only check enabled accounts
            if ($user.accountEnabled -eq $true) {
                if ([string]::IsNullOrEmpty($user.usageLocation)) {
                    $result = $false
                    $usersWithoutLocation += $user
                }
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "✅ **Well done!** All enabled member users have usageLocation configured." -GraphObjects @() -GraphObjectType Users
        } else {
            $failureMessage = "❌ **Failed:** $($usersWithoutLocation.Count) enabled member user(s) do not have usageLocation set, preventing license assignment.`n`n%TestResult%"
            Add-MtTestResultDetail -Result $failureMessage -GraphObjects $usersWithoutLocation -GraphObjectType Users
        }

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
