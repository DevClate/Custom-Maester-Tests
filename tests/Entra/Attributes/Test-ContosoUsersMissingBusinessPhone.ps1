function Test-ContosoUsersMissingBusinessPhone {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","businessPhones"
        $usersWithoutBusinessPhone = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if (-not $user.businessPhones -or [string]::IsNullOrEmpty($user.businessPhones[0])) {
                $result = $false
                $usersWithoutBusinessPhone += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a business phone assigned."
        } else {
            $TestResults = "No business phone is assigned for the following users.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutBusinessPhone -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}