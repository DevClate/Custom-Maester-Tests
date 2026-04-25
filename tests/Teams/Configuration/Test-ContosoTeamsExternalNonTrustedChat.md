This test checks if external non-trusted meeting chat is disabled in Microsoft Teams.

Contoso's company policy requires external non-trusted meeting chat to be disabled to prevent data exfiltration and phishing attacks. When enabled, this feature allows external participants from non-federated organizations to participate in meeting chat, which could expose sensitive information.

**To remediate this issue:**

- Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the **Global (Org-wide default)** policy
- Under **Meeting join & lobby** section, find **Allow external non-trusted meeting chat**
- Set this to **Off**
- Click **Save**

**Learn more:**

- [Manage meeting policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-overview)
- [Manage external meetings and chat](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)

<!--- Results --->

%TestResult%
