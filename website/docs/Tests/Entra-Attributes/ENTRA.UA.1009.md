---
title: ENTRA.UA.1009 - All users should have an office location set
description: Ensures all users should have a valid office location
---
## All users should have an office location set

## Description

All users should have an assigned office location. This helps with compliance, presence, and workspace logistics.

## How to fix

Confirm with HR the correct office location.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -OfficeLocation "HQ Building 1"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
