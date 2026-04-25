---
title: TEAMS.TC.5019 - Email into channel should be disabled
description: Ensures email into channel is disabled to prevent bypassing email security controls
---
## Email into channel should be disabled

## Description

Email into channel must be disabled in Microsoft Teams to prevent bypassing email security controls. When enabled, this feature allows users to send emails directly to a Teams channel using a channel-specific email address, which can bypass critical security protections.

**Security Risks:**

Email into channel can bypass:
- Anti-phishing protection
- Anti-malware scanning
- Data Loss Prevention (DLP) policies
- Email encryption requirements
- External sender warnings
- Attachment filtering rules

This creates a potential security gap where malicious content could be delivered directly into Teams channels without proper security scrutiny.

:::warning Security Risk
Email into channel bypasses organizational email security controls, creating an unprotected pathway for malicious content delivery.
:::

## How to fix

### Disable Email into Channel in Teams Admin Center

1. Navigate to the [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
2. Expand **Email integration**
3. Locate **Allow users to send emails to a channel email address**
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current email into channel setting
Get-CsTeamsClientConfiguration | Select-Object AllowEmailIntoChannel

# Disable email into channel
Set-CsTeamsClientConfiguration -AllowEmailIntoChannel $false

# Verify the change
Get-CsTeamsClientConfiguration | Select-Object AllowEmailIntoChannel
```

## Impact

Disabling email into channel will:
- ✅ Force all email to go through organizational security controls
- ✅ Ensure consistent application of DLP policies
- ✅ Maintain anti-phishing and anti-malware protection
- ⚠️ Users can no longer email content directly to channels

:::info Alternative
Users can still share email content by forwarding emails to their own inbox and then sharing in Teams, ensuring security controls are applied.
:::

## Related links

* [Teams admin center - Teams settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
* [Manage Teams settings for your organization](https://learn.microsoft.com/microsoftteams/enable-features-office-365)
* [Send email to a channel in Teams](https://learn.microsoft.com/microsoftteams/send-an-email-to-a-channel-in-teams)
* [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)
* [Set-CsTeamsClientConfiguration](https://learn.microsoft.com/powershell/module/teams/set-csteamsclientconfiguration)
