function Test-ContosoTeamsAllowBox {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowBox = $clientConfig.AllowBox

        if ($allowBox -eq $false) {
            $TestResults = "Well done! Box integration is properly disabled in Teams."
        } else {
            $result = $false
            $TestResults = "Box integration is enabled in Teams, which can lead to data exfiltration.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
