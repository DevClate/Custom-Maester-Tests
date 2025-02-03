---
title: ENTRA.UV.1003 - All users must have a valid city from the approved list
description: Ensures all users have a valid city from the approved list.
---
## All users should have a valid City

## Description

All users should have a valid street address on record to ensure proper mail delivery and compliance with corporate data standards

## How to fix

Confirm with HR the correct city for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -City "Seattle"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
