function Test-ContosoTeamsAnonymousJoinMeeting {
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
        $allowAnonymousJoin = $TeamsMeetingPolicyGlobal.AllowAnonymousUsersToJoinMeeting

        if ($allowAnonymousJoin -eq $false) {
            $TestResults = "Well done! Anonymous users are properly restricted from joining meetings."
        } else {
            $result = $false
            $TestResults = "Anonymous users are allowed to join meetings, which increases exposure to uninvited attendees.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
