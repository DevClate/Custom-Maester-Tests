function Test-ContosoTeamsAllowDropBox {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowDropBox = $clientConfig.AllowDropBox

        if ($allowDropBox -eq $false) {
            $TestResults = "Well done! Dropbox integration is properly disabled in Teams."
        } else {
            $result = $false
            $TestResults = "Dropbox integration is enabled in Teams, which can lead to data exfiltration."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
