function Test-ContosoTeamsAppSideloading {
    $result = $true

    try {
        # Check Teams connection
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams app setup policy
        $appSetupPolicy = Get-CsTeamsAppSetupPolicy | Where-Object { $_.Identity -eq "Global" }
        $allowSideLoading = $appSetupPolicy.AllowSideLoading

        if ($allowSideLoading -eq $false) {
            $TestResults = "Well done! App sideloading is properly disabled."
        } else {
            $result = $false
            $TestResults = "App sideloading is enabled, which bypasses security review processes.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
