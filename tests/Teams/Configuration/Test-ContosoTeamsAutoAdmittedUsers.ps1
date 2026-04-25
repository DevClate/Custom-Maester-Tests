function Test-ContosoTeamsAutoAdmittedUsers {
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
        $autoAdmitSetting = $TeamsMeetingPolicyGlobal.AutoAdmittedUsers

        if ($autoAdmitSetting -in @('EveryoneInCompany', 'OrganizerOnly', 'InvitedUsers')) {
            $TestResults = "✅ **Passed:** Auto-admitted users is currently set to **$autoAdmitSetting** in the Global policy, which is a secure configuration."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** Auto-admitted users is set to **$autoAdmitSetting**, which may allow unauthorized access. Consider changing to EveryoneInCompany, OrganizerOnly, or InvitedUsers."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
