---
title: ENTRA.UV.1006 - All users must have a valid country from the approved list
description: Ensures all users have a valid country from the approved list.
---
## All users should have a valid Country

## Description

All users should use a country from a known allowed list. This information is crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct country for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -Country "USA"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
