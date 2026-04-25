function Test-ContosoUsers{PURPOSE} {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")
    )
    $result = $true

    try {
        # Log the ValidatingPath for debugging
        Write-Output "Using ValidatingPath: $ValidatingPath"
        
        # Load valid values from validation.json
        $validation = Get-Content -Path $ValidatingPath -Raw | ConvertFrom-Json -Depth 10
        $valid{VALUES} = $validation.valid{VALUES}

        # Retrieve all member users from Graph
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName,{ATTRIBUTES}"
        $invalidUsers = @()

        foreach ($user in $users) {
            # ALWAYS skip sync account
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            # Validate attribute using case-sensitive comparison
            if ($null -eq $user.{ATTRIBUTE} -or -not ($valid{VALUES} | Where-Object { $_.{ATTRIBUTE} -ceq $user.{ATTRIBUTE} })) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "{SUCCESS_MESSAGE}"
        } else {
            $TestResults = "{FAILURE_MESSAGE}:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
