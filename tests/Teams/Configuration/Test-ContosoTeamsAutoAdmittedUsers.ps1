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
            $TestResults = "Well done! Auto-admitted users setting is properly restricted."
        } else {
            $result = $false
            $TestResults = "Auto-admitted users is set to $autoAdmitSetting, which may allow unauthorized access."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
