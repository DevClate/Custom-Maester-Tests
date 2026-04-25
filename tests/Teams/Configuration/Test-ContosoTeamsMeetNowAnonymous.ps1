function Test-ContosoTeamsMeetNowAnonymous {
    <#
    .SYNOPSIS
        Checks if Meet Now is disabled to prevent unauthorized meetings
    .DESCRIPTION
        TEAMS.TC.5034 - Meet Now allows users to start ad-hoc meetings without scheduling.
        This test verifies that AllowMeetNow is set to FALSE to prevent unauthorized meetings.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $allowMeetNow = $meetingPolicy.AllowMeetNow

        if ($allowMeetNow -eq $false) {
            $TestResults = "Well done! Meet Now is disabled, preventing unauthorized ad-hoc meetings."
        } else {
            $result = $false
            $TestResults = "Meet Now is enabled. This allows users to start unscheduled meetings, which may bypass meeting controls."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
