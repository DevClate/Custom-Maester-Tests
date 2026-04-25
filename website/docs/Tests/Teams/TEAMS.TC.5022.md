---
title: TEAMS.TC.5022 - External participants should not be allowed to give or request control
description: Prevents external participants from controlling shared screens to protect against security risks
---

# TEAMS.TC.5022 - External Participant Control

## Description

This test checks if external participants can give or request control of shared screens in Microsoft Teams meetings.

## Policy Statement

Contoso's company policy requires that external participants cannot give or request control of shared content to prevent unauthorized access to internal systems and data. Allowing external control could enable malicious actors to access sensitive information or perform unauthorized actions on internal systems.

## Why This Matters

- **System Access:** External participants could access internal applications and systems
- **Data Security:** Control of shared screens enables access to sensitive information
- **Malware Risk:** External users could execute malicious actions on internal systems
- **Compliance:** Violates principle of least privilege for external access
- **Data Exfiltration:** External users could navigate to and capture confidential data
- **Administrative Actions:** External users could perform unauthorized configuration changes

## Remediation Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Content sharing** section, find **External participants can give or request control**
4. Set this to **Off**
5. Click **Save**

## Security Considerations

This setting prevents external participants from:
- Taking control of internal user's shared screen
- Requesting control during screen sharing sessions
- Navigating to sensitive areas of shared applications
- Performing actions on behalf of internal users

## Learn More

- [Manage meeting policies for content sharing](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-content-sharing)
- [Security best practices for Teams meetings](https://learn.microsoft.com/en-us/microsoftteams/teams-security-best-practices-for-safer-meetings)
- [External access in Teams](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
