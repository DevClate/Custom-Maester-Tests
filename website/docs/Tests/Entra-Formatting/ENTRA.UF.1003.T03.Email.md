---
title: ENTRA.UF.1003.T03.Email - All user emails must be in firstname.lastname format with all lowercase
description: Ensures all user emails should be in firstname.lastname format with all lowercase
---
## All user emails must be in firstname.lastname format with all lowercase

## Description

All user emails must be in firstname.lastname format with all lowercase. Contoso’s policy requires a consistent email format for branding.

## How to fix

Confirm with HR the correct email format for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@contoso.com -Mail "jack.smith@contoso.com"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
