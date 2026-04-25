function Test-ContosoTeamsAnonymousDialOut {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams meeting policy
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy
        $TeamsMeetingPolicyGlobal = $TeamsMeetingPolicy | Where-Object { $_.Identity -eq "Global" }
        
        # Check if property exists (optional property)
        if ($null -eq $TeamsMeetingPolicyGlobal.PSObject.Properties['AllowAnonymousUsersToDialOut']) {
            $TestResults = "The AllowAnonymousUsersToDialOut property is not available in your tenant. This setting may not be available in all licensing tiers or tenant configurations."
            Add-MtTestResultDetail -Result $TestResults
            Set-ItResult -Skipped -Because "Property AllowAnonymousUsersToDialOut not available"
            return $null
        }

        $allowAnonymousDialOut = $TeamsMeetingPolicyGlobal.AllowAnonymousUsersToDialOut

        if ($allowAnonymousDialOut -eq $false) {
            $TestResults = "Well done! Anonymous users are properly restricted from dialing out."
        } else {
            $result = $false
            $TestResults = "Anonymous users are allowed to dial out, which can lead to toll fraud and unauthorized PSTN usage.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
