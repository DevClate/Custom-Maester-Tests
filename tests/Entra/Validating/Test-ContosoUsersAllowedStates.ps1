function Test-ContosoUsersAllowedStates {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid states from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validStates = $validation.validLocations.state

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","state"
        $usersNotInList = @()

        foreach ($user in $users) {
            # Skip certain accounts you do not want to evaluate
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Check if state is missing or invalid (case-sensitive)
            if ($null -eq $user.state -or -not ($validStates | Where-Object { $_ -ceq $user.state })) {
                $result = $false
                $usersNotInList += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a state in the valid list."
        } else {
            $TestResults = "These users have states not found in the valid list:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersNotInList -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}