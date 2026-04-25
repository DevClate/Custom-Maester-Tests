---
title: TEAMS.TC.5001 - Dropbox integration should be disabled
description: Ensures Dropbox integration is disabled in Teams to prevent data exfiltration
---
## Dropbox integration should be disabled

## Description

This test checks if Dropbox integration is disabled in Microsoft Teams.

## Policy Statement

Contoso's company policy requires that third-party storage integration like Dropbox must be disabled to prevent data exfiltration. Files stored through Dropbox are outside organizational control and may not comply with data governance, retention, and compliance policies.

## Why This Matters

When Dropbox integration is enabled, users can:
- Share files to Dropbox from Teams channels
- Store Teams content in Dropbox storage
- Bypass organizational data loss prevention (DLP) policies
- Move sensitive data outside the organization's security boundaries

:::warning Security Risk
Enabling third-party storage services creates potential data exfiltration pathways that bypass organizational security controls.
:::

## How to fix

### Disable Dropbox Integration in Teams Admin Center

1. Navigate to the [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
2. Expand the **Files** section
3. Under **Third-party cloud storage services**, locate **Dropbox**
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current Dropbox integration setting
Get-CsTeamsClientConfiguration | Select-Object AllowDropBox

# Disable Dropbox integration
Set-CsTeamsClientConfiguration -AllowDropBox $false

# Verify the change
Get-CsTeamsClientConfiguration | Select-Object AllowDropBox
```

## Impact

Disabling Dropbox integration will:
- ✅ Prevent users from sharing files to Dropbox from Teams
- ✅ Force users to use approved storage solutions (OneDrive, SharePoint)
- ✅ Ensure all files remain within organizational compliance boundaries
- ⚠️ Existing Dropbox integrations in channels may stop working

:::info
Users who previously used Dropbox integration will need to migrate their workflows to use OneDrive for Business or SharePoint.
:::

## Related third-party storage services

Consider reviewing and disabling other third-party storage integrations:
- **Box** (`AllowBox`) - [TEAMS.TC.5002](./TEAMS.TC.5002.md)
- **Google Drive** (`AllowGoogleDrive`) - [TEAMS.TC.5003](./TEAMS.TC.5003.md)
- **Citrix ShareFile** (`AllowShareFile`) - [TEAMS.TC.5004](./TEAMS.TC.5004.md)
- **Egnyte** (`AllowEgnyte`)

All third-party storage services should be evaluated against your organization's security and compliance requirements.

## Related links

* [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
* [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
* [Third-party cloud storage in Teams](https://learn.microsoft.com/microsoftteams/teams-settings)
* [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)
* [Set-CsTeamsClientConfiguration](https://learn.microsoft.com/powershell/module/teams/set-csteamsclientconfiguration)
