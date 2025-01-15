function Test-ContosoUsersMissingPostalCode {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","postalCode"
        $usersWithoutPostalCode = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.postalCode)) {
                $result = $false
                $usersWithoutPostalCode += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a postal code assigned."
        } else {
            $TestResults = "No postal code is assigned for the following users:`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutPostalCode -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}