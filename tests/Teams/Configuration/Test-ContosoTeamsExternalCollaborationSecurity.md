This test checks external collaboration security settings in Microsoft Teams including federation, guest access, and public users.

Contoso's company policy requires external collaboration to be configured with appropriate security controls to prevent unauthorized access and data leakage.

**To remediate this issue:**

- Navigate to [Teams Admin Center - External Access](https://admin.teams.microsoft.com/company-wide-settings/external-communications)
- Under **Teams users in external organizations**:
  - Choose **Allow only specific external domains** (recommended)
  - Add trusted partner domains to the allowed list
- Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
- Review **AllowPSTNUsersToBypassLobby** setting and set to **Off** for better security
- **Note:** AllowPublicUsers (Skype consumer communication) may be located at [Skype for Business Settings](https://admin.teams.microsoft.com/company-wide-settings/sfb) or may only be configurable via PowerShell using `Set-CsTeamsClientConfiguration -AllowPublicUsers $false`

**Learn more:**

- [Manage external meetings and chat in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)

<!--- Results --->

%TestResult%
