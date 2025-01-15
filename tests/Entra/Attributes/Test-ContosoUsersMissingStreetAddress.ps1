function Test-ContosoUsersMissingStreetAddress {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","streetAddress" 
        $usersWithoutStreetAddress = @()

        foreach ($user in $users) {
            if ($user.jobTitle -eq "CEO" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.streetAddress)) {
                $result = $false
                $usersWithoutStreetAddress += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without street addresses assigned."
        } else {
            $TestResults += "No street address is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutStreetAddress -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}