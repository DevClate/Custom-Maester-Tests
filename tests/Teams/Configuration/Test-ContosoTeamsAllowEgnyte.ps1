function Test-ContosoTeamsAllowEgnyte {
    <#
    .SYNOPSIS
        Checks if Egnyte integration is disabled in Teams
    .DESCRIPTION
        TEAMS.TC.5005 - Egnyte integration should be disabled to prevent data exfiltration
    #>
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowEgnyte = $clientConfig.AllowEgnyte

        if ($allowEgnyte -eq $false) {
            $TestResults = "Well done! Egnyte integration is properly disabled in Teams."
        } else {
            $result = $false
            $TestResults = "Egnyte integration is enabled in Teams, which can lead to data exfiltration."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
