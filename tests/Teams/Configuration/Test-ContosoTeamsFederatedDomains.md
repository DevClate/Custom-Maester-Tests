This test checks if Microsoft Teams federation is restricted to specific allowed domains rather than allowing open federation.

Contoso's company policy requires federation to be restricted to trusted partner domains to prevent unauthorized external access and reduce security risks. Open federation allows any external Teams organization to contact your users, which can lead to phishing, social engineering, and data leakage.

**To remediate this issue:**

- Navigate to [Teams Admin Center - External Access](https://admin.teams.microsoft.com/company-wide-settings/external-communications)
- Under **Teams and Skype for Business users in external organizations**
- Select **Allow only specific external domains**
- Add your trusted partner domains to the allowed list
- Remove any domains from the blocked list if using allow list
- Click **Save**

**Learn more:**

- [Manage external access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
- [External access vs guest access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations)

<!--- Results --->

%TestResult%
