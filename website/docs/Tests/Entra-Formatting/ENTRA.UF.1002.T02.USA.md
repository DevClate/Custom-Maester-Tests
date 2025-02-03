---
title: ENTRA.UF.1002.T02.USA - All users should have a valid US business phone number - (123) 456-7890
description: All users must have a valid business number in the format (XXX) XXX-XXXX
---
## All users should have a valid business phone number

## Description

All users should have the correct format for their business phone number, e.g., (123) 456-7890. This ensures consistent contact details across the organization.

## How to fix

Confirm with HR the correct business phone number format for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@contoso.com -BusinessPhones @("(123) 456-7890")
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser)
