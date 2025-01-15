function Test-ContosoUsersMissingCountry {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","country"
        $usersWithoutCountry = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.country)) {
                $result = $false
                $usersWithoutCountry += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a country assigned."
        } else {
            $TestResults += "No country is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutCountry -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}