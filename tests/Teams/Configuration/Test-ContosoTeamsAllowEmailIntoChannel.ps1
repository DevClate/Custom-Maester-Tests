function Test-ContosoTeamsAllowEmailIntoChannel {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams client configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $allowEmailIntoChannel = $clientConfig.AllowEmailIntoChannel

        if ($allowEmailIntoChannel -eq $false) {
            $TestResults = "Well done! Email into channel is properly disabled."
        } else {
            $result = $false
            $TestResults = "Email into channel is enabled, which can bypass email security controls."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
