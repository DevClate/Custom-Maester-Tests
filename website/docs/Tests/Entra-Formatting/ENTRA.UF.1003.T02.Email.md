---
title: ENTRA.UF.1003.T02.Email - All users must have a lower case first initial plus a lowerc case surname
description: Ensure all user emails are in the correct lower case initial plus lower case surname format
---
## All users must have a lower case first initial plus a lower case surname

## Description

All user emails must have a lower case first initial plus lower case surname. Contoso’s policy requires a consistent email format for branding.

## How to fix

Clarify from HR the correct email format.

Then run:

```powershell
Update-MgUser -UserID testuser@contoso.com -Mail "jsmith@contoso.com"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
