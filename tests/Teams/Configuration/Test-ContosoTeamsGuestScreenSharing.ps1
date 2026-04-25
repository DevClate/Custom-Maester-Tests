function Test-ContosoTeamsGuestScreenSharing {
    <#
    .SYNOPSIS
        Checks guest screen sharing mode
    .DESCRIPTION
        TEAMS.TC.5028 - Guest screen sharing should be limited to prevent data leakage
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $guestMeetingConfig = Get-CsTeamsGuestMeetingConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/guest-configuration"

        $screenSharingMode = if ($null -ne $guestMeetingConfig.ScreenSharingMode) { 
            $guestMeetingConfig.ScreenSharingMode.ToString() 
        } else { 
            "Not Set" 
        }

        if ($guestMeetingConfig.ScreenSharingMode -eq 'Disabled' -or $guestMeetingConfig.ScreenSharingMode -eq 'SingleApplication') {
            $TestResults = "Well done! Guest screen sharing is appropriately restricted (Mode: $screenSharingMode)."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** ScreenSharingMode in [Guest configuration]($portalLink) should be 'Disabled' or 'SingleApplication' but is currently $screenSharingMode."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
