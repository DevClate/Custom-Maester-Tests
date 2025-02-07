---
title: ENTRA.UA.1011 - All users should have a mobile phone set
description: Ensures all users should have a valid mobile phone
---
## All users should have a mobile phone set

## Description

All users should have a registered mobile phone number. This ensures communication channels are available when needed.

## How to fix

Confirm with HR to determine their valid mobile phone number.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -MobilePhone '+1 (555) 123-4567'
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
