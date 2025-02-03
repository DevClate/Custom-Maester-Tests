function Test-ContosoUsersAllowedBusinessNumbers {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid business numbers from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $validNumbers = $validation.validLocations.businessPhones

        # Retrieve all member users from Graph, selecting businessPhones
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","businessPhones"
        $invalidUsers = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if the user’s business number is missing OR not in the list of valid business numbers
            $phone = $user.businessPhones[0]
            if ($null -eq $phone -or -not ($validNumbers -contains $phone)) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid business number."
        } else {
            $TestResults = "These users have invalid or missing business numbers:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}