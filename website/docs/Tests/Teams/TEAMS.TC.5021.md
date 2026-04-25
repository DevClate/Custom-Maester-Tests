---
title: TEAMS.TC.5021 - External non-trusted meeting chat should be disabled
description: Ensures external non-trusted meeting chat is disabled to prevent data exfiltration and phishing attacks
---

# TEAMS.TC.5021 - External Non-Trusted Meeting Chat

## Description

This test checks if external non-trusted meeting chat is disabled in Microsoft Teams.

## Policy Statement

Contoso's company policy requires external non-trusted meeting chat to be disabled to prevent data exfiltration and phishing attacks. When enabled, this feature allows external participants from non-federated organizations to participate in meeting chat, which could expose sensitive information.

## Why This Matters

- **Data Exfiltration:** Non-trusted external participants can capture meeting chat content
- **Phishing Risks:** Attackers may use meeting chat to distribute malicious links
- **Social Engineering:** Non-trusted participants may attempt to manipulate employees
- **Compliance:** Meeting chat may contain regulated information
- **Information Control:** Organization loses control over who can access meeting conversations

## Remediation Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Meeting join & lobby** section, find **Allow external non-trusted meeting chat**
4. Set this to **Off**
5. Click **Save**

## Note

This property may not be available in all licensing tiers or tenant configurations. If the property is not available, the test will be skipped.

## Learn More

- [Manage meeting policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-overview)
- [Manage external meetings and chat](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
- [Teams meeting security](https://learn.microsoft.com/en-us/microsoftteams/teams-security-best-practices-for-safer-meetings)
