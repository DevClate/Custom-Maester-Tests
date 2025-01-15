function Test-ContosoUsersMissingOfficeLocation {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","officeLocation"
        $usersWithoutOfficeLocation = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.officeLocation)) {
                $result = $false
                $usersWithoutOfficeLocation += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without an office location assigned."
        } else {
            $TestResults += "No office location is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutOfficeLocation -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}