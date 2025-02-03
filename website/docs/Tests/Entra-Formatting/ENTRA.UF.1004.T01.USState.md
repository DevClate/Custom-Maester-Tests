---
title: ENTRA.UF.1004.T01.USState - US State Abbreviation Formatting
description: Checks if the state attribute is in the format XX
---
## ENTRA.UF.1004.T01.USState - US State Abbreviation Formatting

## Description

All users’ state attribute should be in the two-letter format (e.g. NY).

## How to fix

Confirm with HR the correct email format for the user.

Then run:

```powershell
Update-MgUser -UserId user@contoso.com -State "NY"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
