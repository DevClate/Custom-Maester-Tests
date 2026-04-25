This test checks if anonymous users are restricted from starting Microsoft Teams meetings.

Contoso's company policy requires that anonymous users should not be allowed to start meetings. This prevents unauthorized individuals from creating meetings in your organization's Teams environment and ensures meeting control remains with authenticated users.

**To remediate this issue:**

- Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the **Global (Org-wide default)** policy
- Under **Participants & guests**, locate **Let anonymous people start a meeting**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Learn more:**

- [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)

<!--- Results --->

%TestResult%
