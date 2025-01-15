---
title: ENTRA.UA.1008 - All users should have a department set
description: All users should have an assigned department
---
## All users should have a department set

## Description

All users should have an assigned department. This information is often crucial for HR, facilities, and operations.

## How to fix

Clarify from HR which department the employee belongs to.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -Department DepartmentName
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
