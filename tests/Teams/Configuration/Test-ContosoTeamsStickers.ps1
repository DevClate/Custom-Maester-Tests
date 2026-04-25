function Test-ContosoTeamsStickers {
    <#
    .SYNOPSIS
        Checks if stickers are disabled in Teams messaging policy
    .DESCRIPTION
        TEAMS.TC.5045 - Stickers can contain inappropriate content and should be disabled
        in professional environments. This test verifies that AllowStickers is set to FALSE.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $allowStickers = $messagingPolicy.AllowStickers

        if ($allowStickers -eq $false) {
            $TestResults = "Well done! Stickers are disabled in Teams messaging policy."
        } else {
            $result = $false
            $TestResults = "Stickers are enabled. This can lead to inappropriate content being shared in Teams."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
