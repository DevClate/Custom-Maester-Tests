function Test-ContosoUsersMissingJobTitles {
    $result = $true

    try {
        # Retrieve all users from Microsoft Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'"

        # Initialize an array to track users without a job title
        $usersWithoutJobTitle = @()

        # Loop through each user and ensure they have a job title assigned
        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.jobTitle)) {
                $result = $false
                $usersWithoutJobTitle += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without job titles assigned."
        } else {
            $TestResults = "No job titles are assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutJobTitle -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}