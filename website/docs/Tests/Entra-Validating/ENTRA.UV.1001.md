---
title: ENTRA.UV.1001 - All users must have a valid company name from the approved list
description: Ensures all users have a valid company name from the approved list.
---
## All users should have a valid Company Name

## Description

All users should have a valid company name. This information is crucial for HR, records, and operational efficiency.

## How to fix

Confirm with HR the correct company name for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -companyName "Test Company"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)

<!--- Results --->

%TestResult
