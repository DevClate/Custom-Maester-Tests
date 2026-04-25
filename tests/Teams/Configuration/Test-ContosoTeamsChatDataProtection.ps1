function Test-ContosoTeamsChatDataProtection {
    <#
    .SYNOPSIS
        Checks chat settings that protect sensitive data
    .DESCRIPTION
        TEAMS.TC.5016 - Reviews chat features like URL previews that may leak data to external services
        
        Severity: Medium
    #>
    $result = $true
    $findings = @()

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        
        $portalLink = "https://admin.teams.microsoft.com"

        # Check 1: URL previews (may send URLs to external preview services)
        if ($clientConfig.AllowUrlPreviews -eq $true) {
            $findings += "⚠️ **AllowUrlPreviews** is enabled - URLs may be sent to external preview services"
            $result = $false
        } else {
            $findings += "✅ **URL previews** are disabled (prevents data leakage)"
        }

        # Check 2: Translation (sends messages to translation service)
        if ($messagingPolicy.AllowUserTranslation -eq $true) {
            $findings += "ℹ️ **Message translation** is enabled - messages may be sent to translation services"
        } else {
            $findings += "ℹ️ **Message translation** is disabled"
        }

        # Check 3: Giphy (informational - may not be appropriate for all organizations)
        if ($messagingPolicy.AllowGiphy -eq $true) {
            $giphyRating = $messagingPolicy.GiphyRatingType
            $findings += "ℹ️ **Giphy** is enabled with content rating: $giphyRating"
        }

        # Check 4: Immersive Reader (sends content to Microsoft service)
        if ($clientConfig.AllowImmersiveReader -eq $true) {
            $findings += "ℹ️ **Immersive Reader** is enabled"
        }

        # Build result markdown
        if ($result) {
            $TestResults = "Well done! Chat data protection settings are appropriately configured."
        } else {
            $TestResults = "⚠️ **Chat Data Protection Review**`n`n"
            $TestResults = "**Chat Security Findings:**`n`n"
            foreach ($finding in $findings) {
                $TestResults += "$finding`n"
            }
            $TestResults += "`n**Action Required:** Review chat settings at the [Teams Admin Center]($portalLink) and disable features that may leak sensitive data to external services."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
