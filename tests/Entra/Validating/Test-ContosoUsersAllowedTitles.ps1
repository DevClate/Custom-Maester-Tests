function Test-ContosoUsersAllowedTitles {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true
    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid titles from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $validTitles = $validation.validTitles

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","jobTitle"
        $invalidUsers = @()

        foreach ($user in $users) {
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            # Removed Trim() and using case-sensitive comparison
            if ($null -eq $user.jobTitle -or -not ($validTitles | Where-Object { $_.title -eq $user.jobTitle })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "All users have a valid title."
        } else {
            $TestResults = "These users have invalid or missing titles:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users

    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
