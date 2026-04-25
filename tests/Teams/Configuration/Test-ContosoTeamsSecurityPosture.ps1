function Test-ContosoTeamsSecurityPosture {
    <#
    .SYNOPSIS
        Comprehensive security review of Teams configuration
    .DESCRIPTION
        TEAMS.TC.5043 - Reviews multiple security settings across Teams policies
        including anonymous meeting access, third-party storage, and other security controls.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $clientConfig = Get-CsTeamsClientConfiguration
        $meetingConfig = Get-CsTeamsMeetingConfiguration
        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global

        $TestResults = "Teams Security Posture Review:`n`n"
        
        # Anonymous meeting settings
        $TestResults += "Anonymous Meeting Settings:`n"
        $TestResults += "- Anonymous Join: $($meetingConfig.DisableAnonymousJoin -eq $false)`n"
        $TestResults += "- Anonymous Users in Meetings: $($meetingPolicy.AllowAnonymousUsersToStartMeeting)`n`n"
        
        # Third-party storage
        $TestResults += "Third-Party Storage:`n"
        $TestResults += "- Box: $($clientConfig.AllowBox)`n"
        $TestResults += "- Dropbox: $($clientConfig.AllowDropBox)`n"
        $TestResults += "- Google Drive: $($clientConfig.AllowGoogleDrive)`n`n"
        
        # External access
        $TestResults += "External Access:`n"
        $TestResults += "- Email Integration: $($clientConfig.AllowEmailIntoChannel)`n"
        
        $TestResults += "`nReview these settings to ensure they align with your organization's security requirements."
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
