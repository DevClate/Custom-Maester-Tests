function Test-ContosoUsersMissingFaxNumber {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","faxNumber"
        $usersWithoutFaxNumber = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.faxNumber)) {
                $result = $false
                $usersWithoutFaxNumber += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a fax number assigned."
        } else {
            $TestResults += "No fax number is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutFaxNumber -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}