function Test-ContosoUsersMissingCompanyName {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","companyName"
        $usersWithoutCompanyName = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.companyName)) {
                $result = $false
                $usersWithoutCompanyName += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a company name assigned."
        } else {
            $TestResults += "No company name is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutCompanyName -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}