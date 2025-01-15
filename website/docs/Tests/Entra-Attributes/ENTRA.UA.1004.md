---
title: ENTRA.UA.1004 - All users should have a city set
description: All users must have a valid city attribute
---
## All users should have a city set

## Description

All users should have a valid city attribute. This information is often crucial for HR, facilities, and operations.

## How to fix

Clarify from HR the correct city.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -City "Redmond"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
