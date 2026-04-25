function Test-ContosoTeamsGuestTranscription {
    <#
    .SYNOPSIS
        Checks if transcription control is disabled for guests
    .DESCRIPTION
        TEAMS.TC.5029 - Guests should not control transcription to prevent data capture
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $guestMeetingConfig = Get-CsTeamsGuestMeetingConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/guest-configuration"

        $allowTranscription = if ($null -ne $guestMeetingConfig.AllowTranscription) { 
            $guestMeetingConfig.AllowTranscription.ToString() 
        } else { 
            "Not Set" 
        }

        if ($guestMeetingConfig.AllowTranscription -eq $false) {
            $TestResults = "Well done! Guests cannot control transcription."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** AllowTranscription in [Guest configuration]($portalLink) should be False but is currently $allowTranscription."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
