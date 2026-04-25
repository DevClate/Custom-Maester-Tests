function Test-ContosoUsers{PURPOSE} {
    $result = $true

    try {
        # Get users from Graph API
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName,{ATTRIBUTES}"
        $invalidUsers = @()

        # Define regex pattern for validation
        $expectedPattern = '{REGEX_PATTERN}'

        foreach ($user in $users) {
            # ALWAYS skip sync account
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if attribute matches the expected pattern
            if ([string]::IsNullOrEmpty($user.{ATTRIBUTE}) -or
                $user.{ATTRIBUTE} -notmatch $expectedPattern) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! {SUCCESS_MESSAGE}"
        } else {
            $TestResults = "{FAILURE_MESSAGE}:`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
