---
title: ENTRA.UA.1005 - All users should have a state set
description: Ensures all users should have a valid state
---
## All users should have a state set

## Description

All users should have a valid state attribute. This information is often crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct state.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -State "Washington"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
