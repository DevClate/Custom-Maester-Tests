---
title: TEAMS.TC.5002 - Box integration should be disabled
description: Ensures Box integration is disabled in Teams to prevent data exfiltration
---

# TEAMS.TC.5002 - Box Integration Should Be Disabled

## Description

This test checks if Box integration is disabled in Microsoft Teams to prevent data exfiltration.

## Policy Statement

Contoso's company policy requires all third-party cloud storage services, including Box, to be disabled in Teams to maintain control over corporate data.

## Why This Matters

Allowing third-party storage integrations in Teams creates several risks:

### Data Exfiltration
- Users can upload corporate data to external storage services
- Data may be stored outside organizational control
- Difficult to monitor and audit data transfers
- Potential for data leaks through third-party services

### Compliance Risks
- May violate data residency requirements
- Third-party services may not meet compliance standards
- Difficult to enforce retention policies on external storage
- Could breach contractual obligations about data storage

### Security Concerns
- Third-party services may have different security standards
- Increased attack surface
- Potential for unauthorized access
- Loss of DLP protection when data leaves Microsoft 365

## How to Fix

### Disable via Teams Admin Center

1. Navigate to [Teams Admin Center - Client Configuration](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
2. Scroll to **Files** section
3. Set **Box** to **Off**
4. Click **Save**

### Disable via PowerShell

```powershell
# Disable Box integration
Set-CsTeamsClientConfiguration -AllowBox $false
```

### Verify Current Setting

```powershell
# Check current configuration
Get-CsTeamsClientConfiguration | Select-Object AllowBox

# Should return:
# AllowBox
# --------
# False
```

### Check All Third-Party Storage Settings

```powershell
# Review all third-party storage options
Get-CsTeamsClientConfiguration | Select-Object AllowDropBox, AllowBox, AllowGoogleDrive, AllowShareFile, AllowEgnyte

# Recommended secure configuration (all disabled):
# AllowDropBox      : False
# AllowBox          : False
# AllowGoogleDrive  : False
# AllowShareFile    : False
# AllowEgnyte       : False
```

## Impact Assessment

### Before Disabling

**Consider:**
- Are any teams currently using Box integration?
- Is there business justification for third-party storage?
- What is the migration plan for existing data?
- Have users been notified of the change?

### After Disabling

**Users will:**
- No longer see Box as a file sharing option in Teams
- Need to use OneDrive/SharePoint for file storage
- Require alternative methods to access Box files

**Organization gains:**
- Better control over corporate data
- Improved compliance posture
- Reduced data exfiltration risk
- Centralized data governance

## Approved Storage Solutions

Instead of third-party storage, use Microsoft-approved solutions:

### OneDrive for Business
- Personal file storage
- Full DLP protection
- Audit logging
- Compliance integration

### SharePoint Online
- Team file storage
- Advanced permissions
- Retention policies
- eDiscovery support

### Teams Files
- Channel-based storage (backed by SharePoint)
- Automatic collaboration
- Integrated with Teams chat
- Version control

## Related Tests

- [TEAMS.TC.5001 - Dropbox Integration](TEAMS.TC.5001.md)
- [TEAMS.TC.5003 - Google Drive Integration](TEAMS.TC.5003.md)
- [TEAMS.TC.5004 - Citrix ShareFile Integration](TEAMS.TC.5004.md)
- [TEAMS.TC.5005 - Egnyte Integration](TEAMS.TC.5005.md)

## Learn More

- [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
- [Control third-party storage in Teams](https://learn.microsoft.com/microsoftteams/enhance-office-365-groups)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/security-best-practices)
- [Data Loss Prevention in Teams](https://learn.microsoft.com/purview/dlp-microsoft-teams)
* [Set-CsTeamsClientConfiguration](https://learn.microsoft.com/powershell/module/teams/set-csteamsclientconfiguration)
