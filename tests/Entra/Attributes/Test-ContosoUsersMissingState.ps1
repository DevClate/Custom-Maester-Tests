function Test-ContosoUsersMissingState {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","state"
        $usersWithoutState = @()

        foreach ($user in $users) {
            if ($user.jobTitle -eq "CEO" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.state)) {
                $result = $false
                $usersWithoutState += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a state assigned."
        } else {
            $TestResults += "No state is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutState -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}