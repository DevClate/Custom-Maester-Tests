---
title: TEAMS.TC.5028 - Guest screen sharing should be limited to prevent data leakage
description: Ensures guest screen sharing is restricted to Disabled or SingleApplication mode
---

# TEAMS.TC.5028 - Guest Screen Sharing

## Description

This test checks if guest screen sharing is appropriately restricted in Microsoft Teams.

## Policy Statement

Contoso's company policy requires guest screen sharing to be limited to prevent data leakage and unauthorized information exposure. Allowing full screen sharing by guests could expose sensitive information visible on the guest's desktop.

## Why This Matters

- **Data Leakage Prevention:** Full screen sharing by guests could expose sensitive information on their desktop
- **Security Control:** Limits what guests can share with internal users
- **Malware Risk:** Reduces risk of guests sharing malicious content
- **Professional Standards:** Ensures guest shares are focused and appropriate
- **Information Control:** Prevents unintended disclosure of competitor or third-party data

## Screen Sharing Modes

### ✅ Allowed (Secure)

- **Disabled:** Guests cannot share screens (most secure)
  - Maximum security
  - Prevents all guest screen sharing
  - May limit collaboration

- **SingleApplication:** Guests can only share specific applications (recommended)
  - Good security balance
  - Focuses sharing on specific content
  - Prevents desktop exposure
  - Enables effective collaboration

### ❌ Not Allowed (Risk)

- **EntireScreen:** Guests can share entire desktop
  - High risk of data exposure
  - May reveal sensitive information
  - Desktop notifications visible
  - Other applications visible
  - File explorer access possible

## Security Risks of Full Screen Sharing

When guests share entire screen:
- Desktop files and folders visible
- Notifications from other applications appear
- Browser tabs and bookmarks exposed
- Email previews may be visible
- Credentials or sensitive data may appear
- Third-party or competitor information revealed

## Remediation Steps

1. Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
2. Under **Meetings** section, find **Screen sharing mode**
3. Select either:
   - **Disabled** (most secure - guests cannot share)
   - **Single application** (recommended - guests can share specific apps only)
4. **Do not select** **Entire screen**
5. Click **Save**

## Recommendation

**Single application** mode is recommended for most organizations as it:
- Enables effective guest collaboration
- Prevents unintended data exposure
- Focuses sharing on specific content
- Maintains reasonable security controls

## Learn More

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Configure screen sharing in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-content-sharing)
- [Teams security best practices](https://learn.microsoft.com/en-us/microsoftteams/teams-security-best-practices-for-safer-meetings)
