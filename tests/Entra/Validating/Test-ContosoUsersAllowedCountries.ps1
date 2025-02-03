function Test-ContosoUsersAllowedCountries {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid countries from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validCountries = $validation.validLocations.country

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","country"
        $invalidUsers = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            # Check if country is missing or invalid (case-sensitive)
            if ($null -eq $user.country -or -not ($validCountries | Where-Object { $_ -ceq $user.country })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid country."
        } else {
            $TestResults = "These users have invalid or missing countries:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
