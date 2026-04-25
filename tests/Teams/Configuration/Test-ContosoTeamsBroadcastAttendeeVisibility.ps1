function Test-ContosoTeamsBroadcastAttendeeVisibility {
    <#
    .SYNOPSIS
        Checks broadcast attendee visibility settings
    .DESCRIPTION
        TEAMS.TC.5017 - Attendee visibility in broadcasts should protect privacy
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $broadcastPolicy = Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" }

        $attendeeVisibilityMode = if ($null -ne $broadcastPolicy.BroadcastAttendeeVisibilityMode) { 
            $broadcastPolicy.BroadcastAttendeeVisibilityMode.ToString() 
        } else { 
            "Not Set" 
        }

        if ($broadcastPolicy.BroadcastAttendeeVisibilityMode -ne 'EveryoneInCompany') {
            $TestResults = "Well done! Broadcast attendee visibility is appropriately configured."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** BroadcastAttendeeVisibilityMode should not be 'EveryoneInCompany' but is currently $attendeeVisibilityMode. Use PowerShell to configure this setting."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
