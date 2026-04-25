This test checks if app sideloading is disabled in Microsoft Teams.

Contoso's company policy requires that app sideloading must be disabled to enforce security review processes. Sideloading allows users to install custom apps that haven't gone through the organization's approval and security review process, potentially introducing security risks and malicious code.

**To remediate this issue:**

- Navigate to the [Teams admin center - App setup policies](https://admin.teams.microsoft.com/policies/app-setup)
- Select the **Global (Org-wide default)** policy
- Under **Custom apps**, locate **Allow interaction with custom apps** or **Upload custom apps**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Learn more:**

- [Manage app setup policies in Teams](https://learn.microsoft.com/microsoftteams/teams-app-setup-policies)
- [Upload custom apps in Teams](https://learn.microsoft.com/microsoftteams/upload-custom-apps)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)

<!--- Results --->

%TestResult%
