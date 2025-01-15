function Test-ContosoUsersMissingMobilePhone {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'"
        $usersWithoutMobilePhone = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.mobilePhone)) {
                $result = $false
                $usersWithoutMobilePhone += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a mobile phone assigned."
        } else {
            $TestResults += "No mobile phone is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutMobilePhone -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}