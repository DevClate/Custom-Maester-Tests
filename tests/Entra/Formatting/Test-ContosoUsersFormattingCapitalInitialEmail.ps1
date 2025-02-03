function Test-ContosoUsersFormattingCapitalInitialEmail {
    $result = $true
    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","givenName","surname","mail"
        $incorrectEmailUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            if ([string]::IsNullOrEmpty($user.givenName) -or [string]::IsNullOrEmpty($user.surname) -or [string]::IsNullOrEmpty($user.mail)) {
                $result = $false
                $incorrectEmailUsers += $user
                continue
            }
            $expectedLocalPart = "{0}{1}" -f $user.givenName.Substring(0,1).ToUpper(), ($user.surname.Substring(0,1).ToUpper() + $user.surname.Substring(1).ToLower())
            $actualLocalPart = ($user.mail -split "@")[0]

            if ($actualLocalPart -cne $expectedLocalPart) {
                $result = $false
                $incorrectEmailUsers += $user
            }
        }

        if ($result) {
            $testResults = "All user emails have the correct capital-initial format."
        } else {
            $testResults = "Some user emails do not meet the capital-initial format.`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $testResults -GraphObjects $incorrectEmailUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}