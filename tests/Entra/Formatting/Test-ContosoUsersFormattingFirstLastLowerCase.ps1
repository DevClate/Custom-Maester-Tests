function Test-ContosoUsersFormattingFirstLastLowerCase {
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
            # Remove non-letter characters and convert to lowercase
            $firstName = ($user.givenName -replace "[^a-zA-Z]", "").ToLower()
            $lastName  = ($user.surname -replace "[^a-zA-Z]", "").ToLower()
            $expectedLocalPart = "$firstName.$lastName"
            $actualLocalPart = ($user.mail -split "@")[0]

            if ($actualLocalPart -cne $expectedLocalPart) {
                $result = $false
                $incorrectEmailUsers += $user
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "All users have the correct firstname.lastname email format." -GraphObjects @() -GraphObjectType Users
        }
        else {
            Add-MtTestResultDetail -Result "Some users do not meet the firstname.lastname email format.`n%TestResult%" -GraphObjects $incorrectEmailUsers -GraphObjectType Users
        }
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
