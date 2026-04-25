---
title: TEAMS.TC.5002 - Box integration should be disabled
description: Ensures Box integration is disabled in Teams to prevent data exfiltration
---
## Box integration should be disabled

## Description

Box integration must be disabled in Microsoft Teams to prevent data exfiltration. Third-party storage integration like Box allows files to be stored outside organizational control, which may not comply with data governance, retention, and compliance policies.

When Box integration is enabled, users can:
- Share files to Box from Teams channels
- Store Teams content in Box storage
- Bypass organizational data loss prevention (DLP) policies
- Move sensitive data outside the organization's security boundaries

:::warning Security Risk
Enabling third-party storage services creates potential data exfiltration pathways that bypass organizational security controls.
:::

## How to fix

### Disable Box Integration in Teams Admin Center

1. Navigate to the [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
2. Expand the **Files** section
3. Under **Third-party cloud storage services**, locate **Box**
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current Box integration setting
Get-CsTeamsClientConfiguration | Select-Object AllowBox

# Disable Box integration
Set-CsTeamsClientConfiguration -AllowBox $false

# Verify the change
Get-CsTeamsClientConfiguration | Select-Object AllowBox
```

## Impact

Disabling Box integration will:
- ✅ Prevent users from sharing files to Box from Teams
- ✅ Force users to use approved storage solutions (OneDrive, SharePoint)
- ✅ Ensure all files remain within organizational compliance boundaries
- ⚠️ Existing Box integrations in channels may stop working

:::info
Users who previously used Box integration will need to migrate their workflows to use OneDrive for Business or SharePoint.
:::

## Related third-party storage services

Consider reviewing and disabling other third-party storage integrations:
- **Dropbox** (`AllowDropBox`)
- **Google Drive** (`AllowGoogleDrive`)
- **ShareFile** (`AllowShareFile`)
- **Egnyte** (`AllowEgnyte`)

All third-party storage services should be evaluated against your organization's security and compliance requirements.

## Related links

* [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
* [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
* [Third-party cloud storage in Teams](https://learn.microsoft.com/microsoftteams/teams-settings)
* [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)
* [Set-CsTeamsClientConfiguration](https://learn.microsoft.com/powershell/module/teams/set-csteamsclientconfiguration)
