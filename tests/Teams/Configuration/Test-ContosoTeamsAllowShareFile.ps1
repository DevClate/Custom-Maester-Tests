function Test-ContosoTeamsAllowShareFile {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowShareFile = $clientConfig.AllowShareFile

        if ($allowShareFile -eq $false) {
            $TestResults = "Well done! ShareFile integration is properly disabled in Teams."
        } else {
            $result = $false
            $TestResults = "ShareFile integration is enabled in Teams, which can lead to data exfiltration."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
