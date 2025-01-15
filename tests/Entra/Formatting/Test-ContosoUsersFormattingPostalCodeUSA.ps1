function Test-ContosoUsersFormattingPostalCodeUSA {
    $result = $true

    try {
        # Retrieve all Member-type users
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","postalCode"

        # Prepare an array to hold users who do NOT have a valid US ZIP/ZIP+4 format
        $usersWithoutValidPostalCode = @()
        
        # Define the pattern for a US ZIP or ZIP+4
        $usZipPattern = '^\d{5}(?:-\d{4})?$'

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if the user’s postal code is missing OR does not match the US ZIP pattern
            if ([string]::IsNullOrEmpty($user.postalCode) -or
                $user.postalCode -notmatch $usZipPattern) {
                
                $result = $false
                $usersWithoutValidPostalCode += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! All users have a valid US ZIP/ZIP+4 postal code."
        } else {
            $TestResults = "The following users are missing or have an invalid US ZIP/ZIP+4 postal code:`n%TestResult%"
        }

        # Add the results (with details) for your custom reporting
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutValidPostalCode -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}