---
title: ENTRA.UV.1007 - All users must have a valid business phone from the approved list
description: Ensures all users have a business phone from the approved list.
---
## All users should have a valid Business Phone Number

## Description

All users should use a business phone from a known valid list. This information is crucial for HR, facilities, and operations.

## How to fix

Confirm with HR the correct business phone number for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@contoso.com -BusinessPhones @("(123) 456-7890 x123")
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
