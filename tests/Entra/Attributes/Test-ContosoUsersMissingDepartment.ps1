function Test-ContosoUsersMissingDepartment {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","department"
        $usersWithoutDepartment = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.department)) {
                $result = $false
                $usersWithoutDepartment += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a department assigned."
        } else {
            $TestResults += "No department is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutDepartment -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}