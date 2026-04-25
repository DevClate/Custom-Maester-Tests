function Test-ContosoTeamsGuestMeetNow {
    <#
    .SYNOPSIS
        Checks if Meet Now is disabled for guests
    .DESCRIPTION
        TEAMS.TC.5027 - Guests should not be able to start ad-hoc meetings
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $guestMeetingConfig = Get-CsTeamsGuestMeetingConfiguration
        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/guest-configuration"

        $allowMeetNow = $guestMeetingConfig.AllowMeetNow

        if ($allowMeetNow -eq $false) {
            $TestResults = "Well done! Guests cannot start ad-hoc meetings."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** AllowMeetNow in [Guest configuration]($portalLink) should be False but is currently **$($allowMeetNow)**."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
