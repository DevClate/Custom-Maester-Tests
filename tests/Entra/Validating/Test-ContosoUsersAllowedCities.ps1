function Test-ContosoUsersAllowedCities {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid cities from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validCities = $validation.validLocations.city

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","city"
        $invalidUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            # Check if city is missing or invalid (case-sensitive)
            if ($null -eq $user.city -or -not ($validCities | Where-Object { $_ -ceq $user.city })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid city."
        } else {
            $TestResults = "These users have invalid or missing cities:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
