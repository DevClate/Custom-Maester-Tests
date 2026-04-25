This test checks if call forwarding to external phone numbers (PSTN) is appropriately configured.

Contoso's company policy requires call forwarding to PSTN to be carefully reviewed due to toll fraud risks. This is important because attackers can exploit call forwarding features to forward calls to premium-rate numbers, resulting in significant financial charges to the organization.

**To review this configuration:**

- Navigate to [Teams Admin Center - Calling Policies](https://admin.teams.microsoft.com/policies/calling).
- Review the **AllowCallForwardingToPhone** setting in the Global policy.
- Consider your organization's risk tolerance:
  - **Security Risk**: Compromised accounts can forward calls to premium numbers.
  - **Financial Impact**: Toll fraud can result in thousands of dollars in charges.
  - **Business Need**: Some users may legitimately need call forwarding to external numbers.
- **Best Practice**: Disable for most users and enable only for specific roles that require it.
- Implement monitoring and alerting for unusual call patterns if enabled.

**To disable call forwarding to phone:**

```powershell
Set-CsTeamsCallingPolicy -Identity Global -AllowCallForwardingToPhone $false
```

**Learn more:**

- [Manage calling policies in Teams](https://learn.microsoft.com/microsoftteams/teams-calling-policy)
- [Prevent toll fraud](https://learn.microsoft.com/microsoftteams/toll-fraud-overview)

<!--- Results --->

%TestResult%
