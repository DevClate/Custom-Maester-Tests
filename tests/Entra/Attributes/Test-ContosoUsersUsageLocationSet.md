ENTRA.UA.1017 - All member users must have usageLocation configured

This test validates that every enabled member user in your Microsoft 365 tenant has the usageLocation property set. The usageLocation is a mandatory prerequisite for license assignment in Microsoft 365.

Without a configured usageLocation, administrators cannot assign licenses to users, which prevents access to Microsoft 365 services like Exchange Online, Teams, SharePoint, and other licensed applications.

The usageLocation property must be set to a valid two-letter ISO 3166-1 alpha-2 country code (e.g., "US" for United States, "GB" for United Kingdom, "CA" for Canada).

## Remediation action:

### Option 1: Set usageLocation via Azure Portal

1. Navigate to the [Microsoft Entra admin center](https://entra.microsoft.com)
2. Go to **Users** > **All users**
3. Select the user without usageLocation
4. Click **Edit properties**
5. Under **Settings**, set the **Usage location** field
6. Click **Save**

### Option 2: Set usageLocation via PowerShell (Single User)

```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Set usage location for a specific user
Update-MgUser -UserId "user@domain.com" -UsageLocation "US"
```

### Option 3: Set usageLocation via PowerShell (Bulk Update)

```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Get all users without usageLocation
$usersWithoutLocation = Get-MgUser -Filter "userType eq 'Member' and accountEnabled eq true" -Property Id,DisplayName,UsageLocation,UserPrincipalName -All | Where-Object { [string]::IsNullOrEmpty($_.UsageLocation) }

# Set default usage location (adjust "US" to your organization's location)
foreach ($user in $usersWithoutLocation) {
    Update-MgUser -UserId $user.Id -UsageLocation "US"
    Write-Host "Updated usageLocation for $($user.DisplayName)"
}
```

## Important considerations:

- **Country codes**: Use ISO 3166-1 alpha-2 codes (two-letter country codes)
- **Legal compliance**: Ensure the usageLocation reflects where services will be consumed to comply with data residency requirements
- **Automated provisioning**: Consider setting usageLocation as part of your user onboarding workflow
- **Disabled accounts**: This test only checks enabled accounts, as disabled users don't require licenses

## Related links

- [Assign licenses to users in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/users/licensing-groups-assign)
- [View and assign licenses in the Microsoft 365 admin center](https://learn.microsoft.com/microsoft-365/admin/manage/assign-licenses-to-users)
- [ISO 3166-1 alpha-2 country codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
- [Update-MgUser PowerShell reference](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)

<!--- Results --->

%TestResult%
