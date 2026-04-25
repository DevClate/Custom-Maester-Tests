This test checks if ShareFile integration is disabled in Microsoft Teams.

Contoso's company policy requires that third-party storage integration like ShareFile must be disabled to prevent data exfiltration. Files stored through ShareFile are outside organizational control and may not comply with data governance, retention, and compliance policies.

**To remediate this issue:**

- Navigate to the [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
- Expand the **Files** section
- Under **Third-party cloud storage services**, locate **ShareFile**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Learn more:**

- [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
- [Third-party cloud storage in Teams](https://learn.microsoft.com/microsoftteams/teams-settings)
- [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)

<!--- Results --->

%TestResult%
