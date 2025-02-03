function Test-ContosoUsersAllowedDepartments {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid departments from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $validDepartments = $validation.validDepartments

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","department"
        $invalidUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            # Validate department using case-sensitive comparison
            if ($null -eq $user.department -or -not ($validDepartments | Where-Object { $_.department -ceq $user.department })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid department."
        } else {
            $TestResults = "These users have invalid or missing departments:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
