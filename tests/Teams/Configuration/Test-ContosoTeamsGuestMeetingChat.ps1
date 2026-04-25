function Test-ContosoTeamsGuestMeetingChat {
    <#
    .SYNOPSIS
        Checks guest meeting chat settings
    .DESCRIPTION
        TEAMS.TC.5026 - Review guest meeting chat permissions
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $guestMeetingConfig = Get-CsTeamsGuestMeetingConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/guest-configuration"

        # Convert to string to avoid markdown formatting issues
        $allowMeetingChat = if ($null -ne $guestMeetingConfig.AllowMeetingChat) { 
            $guestMeetingConfig.AllowMeetingChat.ToString() 
        } else { 
            "Not Set" 
        }

        $TestResults = "ℹ️ AllowMeetingChat in [Guest configuration]($portalLink) is currently set to $allowMeetingChat. Review this setting based on your organization's collaboration and security requirements. Meeting chat for guests is typically enabled to facilitate collaboration, but should be reviewed based on organizational data security policies. Consider whether guests should have access to meeting chat history and the potential for sensitive information sharing."

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
