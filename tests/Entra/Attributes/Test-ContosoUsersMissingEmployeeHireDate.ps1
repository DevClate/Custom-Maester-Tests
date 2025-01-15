function Test-ContosoUsersMissingEmployeeHireDate {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","employeeHireDate"
        $usersWithoutHireDate = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.employeeHireDate)) {
                $result = $false
                $usersWithoutHireDate += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without an employee hire date assigned."
        } else {
            $TestResults += "No employee hire date is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutHireDate -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}