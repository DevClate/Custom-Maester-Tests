function Test-ContosoTeamsAllowGoogleDrive {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowGoogleDrive = $clientConfig.AllowGoogleDrive

        if ($allowGoogleDrive -eq $false) {
            $TestResults = "Well done! Google Drive integration is properly disabled in Teams."
        } else {
            $result = $false
            $TestResults = "Google Drive integration is enabled in Teams, which can lead to data exfiltration."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
