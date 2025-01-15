function Test-ContosoUsersMissingEmployeeID {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","employeeId"
        $usersWithoutEmployeeID = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.employeeID)) {
                $result = $false
                $usersWithoutEmployeeID += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without an employee ID assigned."
        } else {
            $TestResults += "No employee ID is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutEmployeeID -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}