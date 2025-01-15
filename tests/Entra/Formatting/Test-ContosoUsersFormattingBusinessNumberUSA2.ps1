
function Test-ContosoUsersFormattingBusinessNumberUSA2 {
    $result = $true

    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","businessPhones"
        $invalidPhones = @()

        $expectedPattern = '^\(\d{3}\)\s\d{3}-\d{4}$'

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if ([string]::IsNullOrEmpty($user.businessPhones[0]) -or
                $user.businessPhones[0] -notmatch $expectedPattern) {
                $result = $false
                $invalidPhones += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! All users have a valid business phone number."
        } else {
            $TestResults = "The following users have an invalid business phone number format:`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidPhones -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}