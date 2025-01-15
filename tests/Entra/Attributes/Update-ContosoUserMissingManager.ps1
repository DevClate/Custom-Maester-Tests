function Update-ContosoUserMissingManager {
    param(
        [Parameter(Mandatory)]
        [string]$UserIdentity,
        [Parameter(Mandatory)]
        [string]$ManagerIdentity
    )

    try {
        # Determine if UserIdentity is a UPN or Object ID
        if ($UserIdentity -match '^[0-9a-fA-F-]{36}$') {
            $UserId = $UserIdentity
        } else {
            $user = Get-MgUser -Filter "userPrincipalName eq '$UserIdentity'"
            if (-not $user) {
                throw "User with identifier '$UserIdentity' not found."
            }
            $UserId = $user.Id
        }

        # Determine if ManagerIdentity is a UPN or Object ID
        if ($ManagerIdentity -match '^[0-9a-fA-F-]{36}$') {
            $ManagerId = $ManagerIdentity
        } else {
            $manager = Get-MgUser -Filter "userPrincipalName eq '$ManagerIdentity'"
            if (-not $manager) {
                throw "Manager with identifier '$ManagerIdentity' not found."
            }
            $ManagerId = $manager.Id
        }

        # Create the manager reference object
        $managerRef = @{
            '@odata.id' = "https://graph.microsoft.com/v1.0/users/$ManagerId"
        }

        # Use the Microsoft Graph PowerShell module to update the user's manager
        Set-MgUserManagerByRef -UserId $UserId -BodyParameter $managerRef

        return $true
    } catch {
        Write-Error $_.Exception.Message
        return $false
    }
}