function Test-ContosoUsersAllowedCompanyNames {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid company names from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json
        $validCompanies = $validation.validLocations.companyName

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","companyName"
        $invalidUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            # Check if companyName is missing or invalid (case-sensitive)
            if ($null -eq $user.companyName -or -not ($validCompanies | Where-Object { $_ -ceq $user.companyName })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid company name."
        } else {
            $TestResults = "These users have invalid or missing company names:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users

    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
