function Test-ContosoTeamsGuestIPVideo {
    <#
    .SYNOPSIS
        Checks guest IP video settings
    .DESCRIPTION
        TEAMS.TC.5025 - Review guest IP video permissions
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $guestMeetingConfig = Get-CsTeamsGuestMeetingConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/guest-configuration"

        $allowIPVideo = if ($null -ne $guestMeetingConfig.AllowIPVideo) { 
            $guestMeetingConfig.AllowIPVideo.ToString() 
        } else { 
            "Not Set" 
        }

        $TestResults = "ℹ️ AllowIPVideo in [Guest configuration]($portalLink) is currently set to $allowIPVideo. Review this setting based on your organization's requirements. IP video for guests is typically allowed to enable full meeting participation. However, organizations with specific security requirements may choose to disable this feature."

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
