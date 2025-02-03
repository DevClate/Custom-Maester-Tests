
function Test-ContosoUsersAllowedStreetAddresses {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid street addresses from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $validAddresses = $validation.validLocations.streetAddress

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","streetAddress"
        $invalidUsers = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if street address is missing or invalid
            if ($null -eq $user.streetAddress -or -not ($validAddresses | Where-Object { $_ -ceq $user.streetAddress})) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid street address."
        } else {
            $TestResults = "These users have invalid or missing street addresses:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}