---
title: ENTRA.UV.1009 - All users must have a valid department from the approved list
description: Ensures all users have a valid department from the approved list.
---
## All users should have a valid Department

## Description

All users should have a valid department on record. This is important for proper organizational classification and ensuring that departmental reporting is accurate.

## How to fix

Confirm with HR the correct department for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -Department "IT"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
