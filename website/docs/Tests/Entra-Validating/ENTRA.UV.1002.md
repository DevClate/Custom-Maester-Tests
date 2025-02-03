---
title: ENTRA.UV.1002 - All users must have a valid street address from the allowed list
description: Ensures all users have a valid street address from the approved list.
---
## All users should have a valid Street Address

## Description

All users must have a valid street address on record to ensure proper mail delivery and compliance with corporate data standards.

## How to fix

Confirm with HR the correct street address for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -StreetAddress "123 Correct St"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
