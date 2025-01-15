---
title: ENTRA.UA.1012 - All users should have a business phone set
description: All users should have a business phone set
---
## All users should have a business phone set

## Description

All users should have a business phone assigned.

## How to fix

Clarify with HR to determine their valid business phone number.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -BusinessPhones "123-456-7890"

```

## Related links

* [Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
* [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
