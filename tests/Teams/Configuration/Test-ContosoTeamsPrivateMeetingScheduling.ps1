function Test-ContosoTeamsPrivateMeetingScheduling {
    <#
    .SYNOPSIS
        Reviews private meeting scheduling status
    .DESCRIPTION
        TEAMS.TC.5038 - Informational test to review whether users can schedule
        private meetings in Teams.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $privateMeeting = $meetingPolicy.AllowPrivateMeetingScheduling

        if ($privateMeeting -eq $true) {
            $TestResults = "Private meeting scheduling is enabled."
        } else {
            $TestResults = "Private meeting scheduling is disabled. Users cannot schedule meetings not visible in their calendar."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
