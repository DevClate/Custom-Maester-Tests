---
title: ENTRA.UV.1005 - All users must have a valid postal code from the approved list
description: All users must have a postal code from the approved list.
---
## All users should have a valid Postal Code

## Description

All users should have a postal code from a known valid list. This information is crucial for HR, facilities, and operations

## How to fix

Confirm wit HR the correct postal code for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -PostalCode "12345"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
