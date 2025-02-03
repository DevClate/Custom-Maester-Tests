---
title: ENTRA.UV.1004 - All users must have a valid state from the approved list
description: All users must have a valid state from the approved list.
---
## All users should have a valid State

## Description

All users should have a valid state. This information is crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct state for user.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -State "WA"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
