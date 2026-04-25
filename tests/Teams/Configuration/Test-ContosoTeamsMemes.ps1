function Test-ContosoTeamsMemes {
    <#
    .SYNOPSIS
        Checks if memes are disabled in Teams messaging policy
    .DESCRIPTION
        TEAMS.TC.5035 - Memes can contain inappropriate content and should be disabled
        in professional environments. This test verifies that AllowMemes is set to FALSE.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $allowMemes = $messagingPolicy.AllowMemes

        if ($allowMemes -eq $false) {
            $TestResults = "Well done! Memes are disabled in Teams messaging policy."
        } else {
            $result = $false
            $TestResults = "Memes are enabled. This can lead to inappropriate content being shared in Teams."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
