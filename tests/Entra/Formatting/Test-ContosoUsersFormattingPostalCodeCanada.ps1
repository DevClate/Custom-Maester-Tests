
function Test-ContosoUsersFormattingPostalCodeCanada {
    $result = $true

    try {
        # Retrieve all Member-type users
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","postalCode"

        # Prepare an array to hold users who do NOT have a valid Canadian postal code format
        $usersWithoutValidPostalCode = @()
        
        # Define the pattern for a Canadian postal code (e.g., A1A 1A1)
        $caPostalCodePattern = '^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$'

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if the user’s postal code is missing OR does not match the Canadian postal code pattern
            if ([string]::IsNullOrEmpty($user.postalCode) -or
                $user.postalCode -notmatch $caPostalCodePattern) {
                
                $result = $false
                $usersWithoutValidPostalCode += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! All users have a valid Canadian postal code."
        } else {
            $TestResults = "The following users are missing or have an invalid Canadian postal code:`n%TestResult%"
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