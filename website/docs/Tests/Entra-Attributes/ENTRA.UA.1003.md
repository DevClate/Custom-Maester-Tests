---
title: ENTRA.UA.1003 - All users should have a street address set
description: Ensures all users must have a valid street address
---
## All users should have a street address set

## Description

All users should have a valid street address. This information is often crucial for HR, facilities, and emergency response.

## How to fix

Confirm with HR the correct street address.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -StreetAddress "123 Main Street"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
