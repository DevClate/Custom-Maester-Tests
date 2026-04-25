function Test-ContosoTeamsExternalParticipantControl {
    <#
    .SYNOPSIS
        Checks if external participants can give or request control in meetings
    .DESCRIPTION
        TEAMS.TC.5022 - External participants should not be allowed to give or request control of shared screens
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy
        $TeamsMeetingPolicyGlobal = $TeamsMeetingPolicy | Where-Object { $_.Identity -eq "Global" }
        $portalLink_MeetingPolicy = "https://admin.teams.microsoft.com/policies/meetings"

        $allowExternalControl = if ($null -ne $TeamsMeetingPolicyGlobal.AllowExternalParticipantGiveRequestControl) { 
            $TeamsMeetingPolicyGlobal.AllowExternalParticipantGiveRequestControl.ToString() 
        } else { 
            "Not Set" 
        }

        if ($TeamsMeetingPolicyGlobal.AllowExternalParticipantGiveRequestControl -eq $false) {
            $TestResults = "Well done! External participants cannot give or request control."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** AllowExternalParticipantGiveRequestControl in [Meeting policies]($portalLink_MeetingPolicy) should be False but is currently $allowExternalControl."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
