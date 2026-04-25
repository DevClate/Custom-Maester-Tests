function Test-ContosoTeamsGiphyContentRating {
    <#
    .SYNOPSIS
        Checks if Giphy content rating is set to Strict
    .DESCRIPTION
        TEAMS.TC.5024 - If Giphy is enabled, the content rating should be set to Strict to prevent inappropriate content
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $TeamsMessagingPolicy = Get-CsTeamsMessagingPolicy
        $TeamsMessagingPolicyGlobal = $TeamsMessagingPolicy | Where-Object { $_.Identity -eq "Global" }
        $portalLink_MessagingPolicy = "https://admin.teams.microsoft.com/policies/messaging"

        $allowGiphy = $TeamsMessagingPolicyGlobal.AllowGiphy
        $giphyRating = $TeamsMessagingPolicyGlobal.GiphyRatingType

        if ($allowGiphy -eq $true) {
            if ($giphyRating -eq "Strict") {
                $TestResults = "Well done! Giphy content rating is set to Strict."
            } else {
                $result = $false
                $TestResults = "❌ **Failed:** Giphy is enabled but GiphyRatingType in [Messaging policies]($portalLink_MessagingPolicy) should be 'Strict' but is currently **$($giphyRating)**."
            }
        } else {
            $TestResults = "Well done! Giphy is disabled."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
