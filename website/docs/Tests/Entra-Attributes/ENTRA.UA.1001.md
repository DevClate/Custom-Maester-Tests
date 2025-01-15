---
title: ENTRA.UA.1001 - All users should have a manager except for CEO
description: All users should have an assigned manager except for the CEO
---
## All users should have a manager set except for CEO

## Description

All users should have an assigned manager except for the CEO

## How to fix

Clarify from HR who the employee's manager is

Then run:

```powershell
# Create the manager reference object
        $managerRef = @{
            '@odata.id' = "https://graph.microsoft.com/v1.0/users/$ManagerId"
        }

        # Use the Microsoft Graph PowerShell module to update the user's manager
        Set-MgUserManagerByRef -UserId $UserId -BodyParameter $managerRef
```

## Related links

- [Set-MgUserManagerByRef | PowerShell Graph cmdlet](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/set-mgusermanagerbyref?view=graph-powershell-1.0)
- [Get-MgUser | PowerShell Graph cmdlet](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/get-mguser?view=graph-powershell-1.0)
