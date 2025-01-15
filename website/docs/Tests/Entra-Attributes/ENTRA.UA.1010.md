---
title: ENTRA.UA.1010 - All users should have a company name set
description: All users should have an assigned company name
---
## All users should have a company name set

## Description

All users should have an assigned company name

## How to fix

Clarify from HR which company the employee belongs to.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -CompanyName CompanyName
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
