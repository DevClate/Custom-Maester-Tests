function Test-ContosoUsersMissingCity {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","city"
        $usersWithoutCity = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.city)) {
                $result = $false
                $usersWithoutCity += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a city assigned."
        } else {
            $TestResults += "No city is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutCity -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}