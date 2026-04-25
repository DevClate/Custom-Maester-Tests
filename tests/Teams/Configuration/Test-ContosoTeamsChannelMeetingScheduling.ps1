function Test-ContosoTeamsChannelMeetingScheduling {
    <#
    .SYNOPSIS
        Checks if channel meeting scheduling is properly configured
    .DESCRIPTION
        TEAMS.TC.5014 - Channel meeting scheduling should be controlled to ensure proper governance
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

        $allowChannelMeetingScheduling = if ($null -ne $TeamsMeetingPolicyGlobal.AllowChannelMeetingScheduling) { 
            $TeamsMeetingPolicyGlobal.AllowChannelMeetingScheduling.ToString() 
        } else { 
            "Not Set" 
        }

        if ($null -ne $TeamsMeetingPolicyGlobal.AllowChannelMeetingScheduling) {
            $TestResults = "ℹ️ AllowChannelMeetingScheduling in [Meeting policies]($portalLink_MeetingPolicy) is currently set to $allowChannelMeetingScheduling. Channel meeting scheduling allows users to create meetings within Teams channels. This should be controlled to ensure proper governance."
        } else {
            $TestResults = "⚠️ AllowChannelMeetingScheduling property not found in [Meeting policies]($portalLink_MeetingPolicy)"
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
