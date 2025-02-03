function Test-ContosoUsersAllowedPostalCodes {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid zip codes from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validZipCodes = $validation.validLocations.zipCode

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","postalCode"
        $usersNotInList = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if the user’s postal code is missing OR not in the list of valid zip codes
            if ($null -eq $user.postalCode -or -not ($validZipCodes -contains $user.postalCode)) {
                $result = $false
                $usersNotInList += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a postal code in the valid list."
        } else {
            $TestResults = "These users have postal codes not found in the valid list:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersNotInList -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}