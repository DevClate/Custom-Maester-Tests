---
title: ENTRA.UV.1008 - All users must have a valid title from the approved list
description: Ensures all users have a valid title from the approved list.
---
## All users should have a valid Title

## Description

All users should have a valid title on record. This information is crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct title for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -JobTitle "IT Manager"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
