---
title: ENTRA.UA.1015 - All users should have an employee hire date set
description: Ensures all users should have a valid hire date attribute
---
## All users should have an employee hire date set

## Description

All users should have a hire date. Hire dates are critical for tenure tracking and benefits calculations.

## How to fix

Confirm with HR the correct hire date.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -EmployeeHireDate "2023-01-15"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph Reference](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
