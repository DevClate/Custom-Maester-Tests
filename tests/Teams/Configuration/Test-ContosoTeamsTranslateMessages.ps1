function Test-ContosoTeamsTranslateMessages {
    <#
    .SYNOPSIS
        Reviews message translation settings for sensitive data concerns
    .DESCRIPTION
        TEAMS.TC.5045 - Message translation sends content to external services.
        This test reviews the AllowUserTranslation setting for potential sensitive
        data exposure through third-party translation services.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $allowTranslation = $messagingPolicy.AllowUserTranslation

        if ($allowTranslation -eq $false) {
            $TestResults = "Message translation is disabled. Sensitive data will not be sent to external translation services."
        } else {
            $TestResults = "Message translation is enabled. Review if sensitive data could be exposed to external translation services."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
