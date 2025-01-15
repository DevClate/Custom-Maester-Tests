---
title: ENTRA.UA.1013 - All users should have a fax number set
description: All users must have a valid fax number attribute
---
## All users should have a fax number set

## Description

All users should have a valid fax number. Some legacy processes still rely on fax communication for certain documentation.

## How to fix

Clarify with HR the correct fax number.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -FaxNumber "+1 (555) 987-6543"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
