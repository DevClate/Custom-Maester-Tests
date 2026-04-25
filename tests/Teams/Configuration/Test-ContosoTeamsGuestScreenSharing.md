This test checks if guest screen sharing is appropriately restricted in Microsoft Teams.

Contoso's company policy requires guest screen sharing to be limited to prevent data leakage and unauthorized information exposure. Allowing full screen sharing by guests could expose sensitive information visible on the guest's desktop.

**Allowed Values:**
- **Disabled**: Guests cannot share screens (most secure)
- **SingleApplication**: Guests can only share specific applications (recommended balance)

**Not Allowed:**
- **EntireScreen**: Guests can share entire screen (risk of data exposure)

**To remediate this issue:**

- Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
- Under **Meetings** section, find **Screen sharing mode**
- Select either:
  - **Disabled** (most secure - guests cannot share)
  - **Single application** (recommended - guests can share specific apps only)
- Click **Save**

**Learn more:**

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Configure screen sharing in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-content-sharing)

<!--- Results --->

%TestResult%
