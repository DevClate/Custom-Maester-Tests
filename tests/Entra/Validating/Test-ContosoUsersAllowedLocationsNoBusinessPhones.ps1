function Test-ContosoUsersAllowedLocationsNoBusinessPhones {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        Write-Output "Using ValidatingPath: $ValidatingPath"
        # Load valid locations from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $validLocations = $validation.validLocations
        
        # Define the list of location properties to check
        $locationFields = @("streetAddress", "city", "state", "postalCode", "country", "companyName")
        $fieldsToSelect = "displayName," + ($locationFields -join ",")
        
        # Retrieve all member users from Graph with the required fields
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select $fieldsToSelect
        $invalidUsers = @()
        
        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") { continue }
            $userMatched = $false
            foreach ($loc in $validLocations) {
                $matchCount = 0
                foreach ($field in $locationFields) {
                    if ($user.$field -ceq $loc.$field) { $matchCount++ }
                }
                if ($matchCount -eq $locationFields.Count) {
                    $userMatched = $true
                    break
                }
            }
            if (-not $userMatched) {
                $result = $false
                $invalidUsers += $user
            }
        }
        
        if ($result) {
            $TestResults = "All users have a valid location."
        } else {
            $TestResults = "These users have invalid or incomplete location information:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
