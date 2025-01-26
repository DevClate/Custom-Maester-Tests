---
title: ENTRA.UF.1001.T01.Canada - All users should have a valid Canadian postal code
description: All users must have a valid Canadian postal code
---
## All users should have a valid Canadian Postal Code

## Description

All users should have a valid Canadian postal code. This information is often crucial for HR, facilities, and operations.

## How to fix

Clarify from HR the correct Canadian postal code.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -PostalCode "A1A1A1"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
