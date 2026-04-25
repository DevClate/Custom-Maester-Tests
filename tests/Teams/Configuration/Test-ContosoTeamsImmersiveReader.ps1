function Test-ContosoTeamsImmersiveReader {
    <#
    .SYNOPSIS
        Reviews Immersive Reader status in Teams messaging policy
    .DESCRIPTION
        TEAMS.TC.5032 - Informational test to review the status of Immersive Reader,
        an accessibility feature in Teams.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $immersiveReader = $messagingPolicy.AllowImmersiveReader

        if ($immersiveReader -eq $true) {
            $TestResults = "Immersive Reader is enabled for accessibility support."
        } else {
            $TestResults = "Immersive Reader is disabled. Consider enabling this accessibility feature."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
