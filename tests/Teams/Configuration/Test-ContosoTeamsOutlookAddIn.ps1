function Test-ContosoTeamsOutlookAddIn {
    <#
    .SYNOPSIS
        Reviews Outlook add-in status for Teams meetings
    .DESCRIPTION
        TEAMS.TC.5037 - Informational test to review whether the Teams meeting
        add-in for Outlook is enabled.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $outlookAddIn = $meetingPolicy.AllowOutlookAddIn

        if ($outlookAddIn -eq $true) {
            $TestResults = "The Teams meeting add-in for Outlook is enabled."
        } else {
            $TestResults = "The Teams meeting add-in for Outlook is disabled. This prevents scheduling Teams meetings from Outlook."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
