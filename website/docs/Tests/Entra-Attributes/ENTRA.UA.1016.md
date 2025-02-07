---
title: ENTRA.UA.1016 - All users should have an employee ID set
description: Ensures all users should have a valid employee ID
---
## All users should have an employee ID set

## Description

Employee IDs uniquely identify users and are crucial for HR and payroll processing.

## How to fix

Confirm with HR the correct employee ID.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -EmployeeId "E12345"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
