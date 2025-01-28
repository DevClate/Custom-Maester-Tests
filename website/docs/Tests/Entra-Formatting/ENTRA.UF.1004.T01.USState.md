---
title: ENTRA.UF.2001.T01.USState - US State Abbreviation Formatting
description: Checks if the state attribute is in the format XX
---
## ENTRA.UF.2001.T01.USState - US State Abbreviation Formatting

## Description

All users’ state attribute should be in the two-letter format with a period after each letter (e.g. NY).

## How to fix

Find users with incorrect state values and update them. Example:
Update-MgUser -UserId user@contoso.com -State "NY"

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
