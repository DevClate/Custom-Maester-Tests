---
title: ENTRA.UA.1014 - All users should have a sponsor set
description: Ensures all users should have a valid sponsor attribute
---
## All users should have a sponsor set

## Description

All users should specify a sponsor for accountability and reference. This is often used for contract or external resources.

## How to fix

Confirm with HR the correct sponsor.

Then run:

```powershell

        # Build the request body for the POST operation
        $Body = @{
            '@odata.id' = "https://graph.microsoft.com/v1.0/users/SPONSORID"
        }

        # Create the sponsor reference URI for the  user
        $Uri = "https://graph.microsoft.com/v1.0/users/USERID/sponsors/`$ref"

        # Update sponsor
        Invoke-MgGraphRequest -Uri $Uri -Method POST -Body $Body

```

## Related links

- [Microsoft Entra admin center - Users](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers/menuId/)
- [Invoke-MgGraphRequest - Microsoft Graph Reference](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/invoke-mggraphrequest?view=graph-powershell-1.0#examples)
- [Add Sponsor - Microsoft Graph v1.0 - Microsoft Learn](https://learn.microsoft.com/en-us/graph/api/user-post-sponsors?view=graph-rest-1.0&tabs=http)
