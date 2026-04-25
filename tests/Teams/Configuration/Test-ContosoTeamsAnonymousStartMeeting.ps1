function Test-ContosoTeamsAnonymousStartMeeting {
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
        $allowAnonymousStart = $TeamsMeetingPolicyGlobal.AllowAnonymousUsersToStartMeeting

        if ($allowAnonymousStart -eq $false) {
            $TestResults = "Well done! Anonymous users are properly restricted from starting meetings."
        } else {
            $result = $false
            $TestResults = "Anonymous users are allowed to start meetings, which poses a security risk."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
