---
title: TEAMS.TC.5020 - External collaboration should be configured with security controls
description: Reviews external collaboration settings including federation, guests, and public users
---

# TEAMS.TC.5020 - External Collaboration Security

## Description

This test checks external collaboration security settings in Microsoft Teams including federation, guest access, and public users.

## Policy Statement

Contoso's company policy requires external collaboration to be configured with appropriate security controls to prevent unauthorized access and data leakage.

## Why This Matters

Proper configuration of external collaboration settings is essential to enable business collaboration while preventing unauthorized access and data leakage.

## Security Checks Performed

1. **Public Users (Skype):**
   - Verify AllowPublicUsers setting
   - Assess risk of consumer Skype communication

2. **Federation Configuration:**
   - Check if federation is open to all domains
   - Review allowed/blocked domain lists
   - Assess federation security posture

3. **Guest Meeting Capabilities:**
   - Review PSTN lobby bypass settings
   - Check guest meeting permissions

## Why This Matters

- **Data Protection:** External users may inadvertently or intentionally leak sensitive data
- **Compliance:** Many regulations require controls on external communication
- **Identity Verification:** Federation and guest access require proper identity management
- **Meeting Security:** External participants may record or share meeting content
- **Phishing/Social Engineering:** Attackers may use external access to target employees
- **Intellectual Property:** External collaboration may expose confidential information

## Remediation Steps

**Configure Federation Security:**

1. Navigate to [Teams Admin Center - External Access](https://admin.teams.microsoft.com/company-wide-settings/external-communications)
2. Under **Teams and Skype for Business users in external organizations**:
   - Choose **Allow only specific external domains** (recommended)
   - Add trusted partner domains to the allowed list
   - Or use **Block specific external domains** if you need open federation
3. Click **Save**

**Secure Guest Meeting Capabilities:**

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Review **AllowPSTNUsersToBypassLobby** setting and set to **Off** for better security

**Disable Public Users (Skype) - Check SFB Settings or PowerShell:**

The AllowPublicUsers setting (Skype consumer communication) may be configurable via:

1. [Teams Admin Center - Skype for Business Settings](https://admin.teams.microsoft.com/company-wide-settings/sfb)
2. Or use PowerShell if not available in the UI:

```powershell
Set-CsTeamsClientConfiguration -AllowPublicUsers $false
```

## Learn More

- [Manage external meetings and chat in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Security best practices for Teams](https://learn.microsoft.com/en-us/microsoftteams/teams-security-guide)
