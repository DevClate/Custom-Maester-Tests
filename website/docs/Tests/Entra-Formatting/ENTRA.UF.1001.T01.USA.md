---
title: ENTRA.UF.1001.T01.USA - All users should have a valid US postal code
description: Ensures all users should have a valid US postal code
---
## All users should have a valid US Postal Code

## Description

All users should have a valid US postal code. This information is often crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct US postal code for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -PostalCode "12345"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
