This test checks if Dropbox integration is disabled in Microsoft Teams.

Contoso's company policy requires all third-party cloud storage services to be disabled in Teams to prevent data exfiltration and maintain control over corporate data. This is important for ensuring that sensitive company information is not stored outside of approved storage locations.

**To remediate this issue:**

- Navigate to the [Teams Admin Center - Client Configuration](https://admin.teams.microsoft.com/company-wide-settings/teams-settings).
- Under **Files**, ensure that **Dropbox** is set to **Off**.
- Save the changes.

**Or use PowerShell:**

```powershell
Set-CsTeamsClientConfiguration -AllowDropBox $false
```

**Verify the setting:**

```powershell
Get-CsTeamsClientConfiguration | Select-Object AllowDropBox
```

**Learn more:**

- [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
- [Control third-party storage in Teams](https://learn.microsoft.com/microsoftteams/enhance-office-365-groups)

<!--- Results --->

%TestResult%
