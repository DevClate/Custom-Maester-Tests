---
title: ENTRA.UV.1010.L01 - All users must have a valid location from the allowed list
description: Ensures all users have a valid location that matches one of the allowed lists.
---
## All users should have a valid Location

## Description

All users should have a complete and accurate location record including street address, city, state, postal code, country, business phones, and company name. This ensures standardization and compliance with enterprise policies.

## How to fix

Confirm with HR or the administrator the correct location details for the user.

Then run:

```powershell
Update-MgUser -UserId testuser@testing.com -StreetAddress "123 Yes Street" -City "New York" -State "NY" -PostalCode "12345" -Country "USA" -BusinessPhones "123-456-7890" -CompanyName "Testing Company"
```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Update-MgUser - Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/module/microsoft.graph.users/update-mguser)
