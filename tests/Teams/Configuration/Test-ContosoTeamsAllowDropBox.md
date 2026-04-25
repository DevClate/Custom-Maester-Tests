This test checks if Dropbox integration is disabled in Microsoft Teams.

Contoso's company policy requires that third-party storage integration like Dropbox must be disabled to prevent data exfiltration. Files stored through Dropbox are outside organizational control and may not comply with data governance, retention, and compliance policies.

**To remediate this issue:**

- Navigate to the [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
- Expand the **Files** section
- Under **Third-party cloud storage services**, locate **Dropbox**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Learn more:**

- [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
- [Third-party cloud storage in Teams](https://learn.microsoft.com/microsoftteams/teams-settings)
- [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)

<!--- Results --->

%TestResult%
