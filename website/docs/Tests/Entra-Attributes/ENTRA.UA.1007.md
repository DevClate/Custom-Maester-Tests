---
title: ENTRA.UA.1007 - All users should have a country set
description: All users must have a valid country attribute
---
## All users should have a country set

## Description

All users should have a valid country attribute. This information is often crucial for HR, facilities, and operations.

## How to fix

Clarify from HR the correct Country.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -Country "USA"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
