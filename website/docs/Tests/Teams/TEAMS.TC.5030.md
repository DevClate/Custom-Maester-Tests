---
title: TEAMS.TC.5030 - URL previews should be disabled
description: Ensures URL previews are disabled to prevent information leakage and phishing exposure
---

# TEAMS.TC.5030 - URL Previews Should Be Disabled

## Description

This test checks if URL previews are disabled in Microsoft Teams conversations.

## Policy Statement

Contoso's company policy requires URL previews to be disabled as they can leak information to external sites when links are shared in conversations. This is important for preventing metadata exposure and maintaining data security.

## Why This Matters

URL previews automatically fetch and display content from links shared in conversations, which can leak information to external sites and expose users to phishing links.

## Why This Matters

- **Information Leakage:** URL preview requests reveal that your organization is accessing specific links
- **Phishing Risk:** Previews may render malicious content or trigger tracking pixels
- **External Requests:** Every link generates requests to external servers
- **Metadata Exposure:** Preview requests may include organizational information
- **Tracking:** External sites can track when and how often links are accessed
- **Privacy:** User activity becomes visible to third-party sites

## Security Risks

When URL previews are enabled:
- External services know your organization accessed a link
- Phishing sites can track engagement
- Malicious sites may attempt browser exploits via preview rendering
- Third-party tracking pixels may execute
- Link metadata is fetched without user consent

## Remediation Steps

1. Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
2. Select the **Global (Org-wide default)** policy
3. Under **URL preview** section, find **Turn on URL previews**
4. Set this to **Off**
5. Click **Save**

## Learn More

- [Manage messaging policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Teams security best practices](https://learn.microsoft.com/en-us/microsoftteams/teams-security-guide)
