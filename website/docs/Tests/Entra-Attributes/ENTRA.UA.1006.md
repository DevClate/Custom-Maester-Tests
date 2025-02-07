---
title: ENTRA.UA.1006 - All users should have a postal code set
description: Ensures all users should have a valid postal code attribute
---
## All users should have a postal code set

## Description

All users should have a valid postal code attribute. This information is often crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct postal code.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -PostalCode "12345"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
