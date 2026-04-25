function Test-ContosoUsers{PURPOSE} {
    $result = $true

    try {
        # Get users from Graph API - Update the Select parameter with needed attributes
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName,{ATTRIBUTES}"
        $invalidUsers = @()

        foreach ($user in $users) {
            # ALWAYS skip sync account
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Add exclusions if needed (e.g., CEOs don't need managers)
            # if ($user.jobTitle -eq "CEO") {
            #     continue
            # }

            # Check if attribute is missing or empty
            if (-not $user.{ATTRIBUTE} -or [string]::IsNullOrEmpty($user.{ATTRIBUTE})) {
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
