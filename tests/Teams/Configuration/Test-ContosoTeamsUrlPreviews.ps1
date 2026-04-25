function Test-ContosoTeamsUrlPreviews {
    <#
    .SYNOPSIS
        Checks if URL previews are disabled in Teams messaging policy
    .DESCRIPTION
        TEAMS.TC.5030 - URL previews can leak information to external sites when links are shared.
        This test verifies that AllowUrlPreviews is set to FALSE for security.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $allowUrlPreviews = $messagingPolicy.AllowUrlPreviews

        if ($allowUrlPreviews -eq $false) {
            $TestResults = "Well done! URL previews are disabled in Teams messaging policy."
        } else {
            $result = $false
            $TestResults = "URL previews are enabled. This can leak information to external sites when links are shared."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
