
# File: Test-ContosoUsersFormattingLowerCaseInitialEmail.ps1

function Test-ContosoUsersFormattingLowerCaseInitialEmail {
    $result = $true
    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","givenName","surname","mail"
        $incorrectEmailUsers = @()

        foreach ($user in $users) {
            if ([string]::IsNullOrEmpty($user.givenName) -or [string]::IsNullOrEmpty($user.surname) -or [string]::IsNullOrEmpty($user.mail)) {
                $result = $false
                $incorrectEmailUsers += $user
                continue
            }
            $expectedLocalPart = ($user.givenName.Substring(0,1) + $user.surname).ToLower()
            $actualLocalPart = ($user.mail -split "@")[0]

            if ($actualLocalPart -cne $expectedLocalPart) {
                $result = $false
                $incorrectEmailUsers += $user
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "All users have the correct lowercase email format." -GraphObjects @() -GraphObjectType Users
        } else {
            Add-MtTestResultDetail -Result "Some users do not meet the lowercase email format.`n%TestResult%" -GraphObjects $incorrectEmailUsers -GraphObjectType Users
        }
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}