This test checks if there are any users without a manager assigned.

Contoso's company policy requires that all users have a manager assigned to them. This is important for accountability and delegation of responsibilities.

**To remediate this issue:**

- Identify the users without a manager.
- Raise a ticket in Service Now using [Form: Manager Missing - HR Ticket](https://contoso.service-now.com/managermissing) to request the manager assignment for the users identified in this test.
  - 🔺 If this is not actioned in three days, escalate to the HR manager.

**How to fix:**

```powershell
# Create the manager reference object
        $managerRef = @{
            '@odata.id' = "https://graph.microsoft.com/v1.0/users/$ManagerId"
        }

        # Use the Microsoft Graph PowerShell module to update the user's manager
        Set-MgUserManagerByRef -UserId $UserId -BodyParameter $managerRef
```

**Learn more:**

- [Manager Missing - HR Ticket](https://contoso.service-now.com/managermissing)
- [HR Escalation Process](https://contoso.service-now.com/hrescalation)

<!--- Results --->

%TestResult%
