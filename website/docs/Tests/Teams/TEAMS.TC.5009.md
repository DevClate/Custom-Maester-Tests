---
title: TEAMS.TC.5009 - App sideloading should be disabled
description: Ensures app sideloading is disabled to enforce security review processes
---
## App sideloading should be disabled

## Description

This test checks if app sideloading is disabled in Microsoft Teams.

## Policy Statement

Contoso's company policy requires that app sideloading must be disabled to enforce security review processes. Sideloading allows users to install custom apps that haven't gone through the organization's approval and security review process, potentially introducing security risks and malicious code.

## Why This Matters

**Security Concerns:**

When app sideloading is enabled:
- Users can install unvetted custom apps
- Apps bypass organizational security review
- Risk of malicious code introduction
- No compliance verification for apps
- Potential for data exfiltration through custom apps
- Difficulty managing and auditing installed apps

:::warning Security Risk
App sideloading bypasses your organization's app governance process, allowing potentially malicious or non-compliant applications to be installed without security review.
:::

## How to fix

### Disable App Sideloading in Teams Admin Center

1. Navigate to the [Teams admin center - App setup policies](https://admin.teams.microsoft.com/policies/app-setup)
2. Select the **Global (Org-wide default)** policy
3. Under **Custom apps**, locate one of these settings:
   - **Allow interaction with custom apps** (newer interface)
   - **Upload custom apps** (older interface)
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current app sideloading setting
Get-CsTeamsAppSetupPolicy -Identity Global | Select-Object AllowSideLoading

# Disable app sideloading
Set-CsTeamsAppSetupPolicy -Identity Global -AllowSideLoading $false

# Verify the change
Get-CsTeamsAppSetupPolicy -Identity Global | Select-Object AllowSideLoading
```

## Impact

Disabling app sideloading will:
- ✅ Enforce organizational app approval processes
- ✅ Ensure all apps undergo security review
- ✅ Reduce risk of malicious app installation
- ✅ Improve app governance and compliance
- ⚠️ Users cannot upload custom apps directly
- ⚠️ Custom apps must go through proper approval channels

:::info Proper App Deployment
Custom apps should be reviewed by IT/security teams and deployed through the Teams app catalog after approval, ensuring they meet organizational security and compliance standards.
:::

## Related links

* [Teams admin center - App setup policies](https://admin.teams.microsoft.com/policies/app-setup)
* [Manage app setup policies in Teams](https://learn.microsoft.com/microsoftteams/teams-app-setup-policies)
* [Upload custom apps in Teams](https://learn.microsoft.com/microsoftteams/upload-custom-apps)
* [Manage custom app policies and settings](https://learn.microsoft.com/microsoftteams/teams-custom-app-policies-and-settings)
* [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)
* [Set-CsTeamsAppSetupPolicy](https://learn.microsoft.com/powershell/module/teams/set-csteamsappsetuppolicy)
