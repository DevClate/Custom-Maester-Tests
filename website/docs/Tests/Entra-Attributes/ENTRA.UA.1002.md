---
title: ENTRA.UA.1002 - All users should have a job title set
description: Ensures all users should have a valid job title
---
## All users should have a job title set

## Description

All users should have a valid job title. This information is often crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct job title.

Then run:

```powershell
Update-MgUser -UserID testuser@testing.com -jobtitle "Support"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
