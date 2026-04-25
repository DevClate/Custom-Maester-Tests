---
title: TEAMS.TC.5026 - Guest meeting chat settings should be reviewed
description: Reviews guest meeting chat permissions based on collaboration and security requirements
---

# TEAMS.TC.5026 - Guest Meeting Chat

## Description

This test reviews the guest meeting chat setting in Microsoft Teams.

## Policy Statement

Contoso's company policy recommends reviewing guest meeting chat permissions based on organizational collaboration and security requirements. Meeting chat for guests enables collaboration but also creates potential for sensitive information sharing.

## Why This Matters

This is an **informational test** that reports the current configuration for organizational review.

Meeting chat for guests enables collaboration but creates considerations for:

- **Information Sharing:** Chat content may contain sensitive business information
- **Collaboration:** Chat enhances meeting participation and follow-up
- **Data Persistence:** Chat history persists after meetings end
- **Compliance:** Chat content is subject to retention and compliance policies
- **Security:** Guests may capture or share chat content externally

## Configuration Options

- **Enabled (Typical):** Guests can participate in meeting chat - recommended for collaboration
- **Disabled:** Guests cannot access meeting chat - may limit collaboration

## Review Considerations

**Reasons to Enable:**
- Facilitates collaboration and information sharing
- Enables guests to ask questions and participate
- Standard for most business environments
- Improves meeting effectiveness
- Allows sharing of links and resources

**Reasons to Disable:**
- Highly sensitive meeting environments
- Strict data control requirements
- Compliance regulations limiting external communication
- Concerns about data persistence
- Need to prevent information capture

## Security Implications

When **Enabled**, consider:
- Chat history persists and is searchable
- Guests can screenshot or copy chat content
- Chat is included in compliance and retention policies
- External participants have ongoing access to chat thread
- Meeting content may be shared outside organization

## Configuration Steps

1. Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
2. Under **Meetings** section, review **Allow meeting chat**
3. Consider your organization's collaboration and security needs:
   - **Enabled**: Guests can participate in meeting chat (recommended for collaboration)
   - **Disabled**: Guests cannot access meeting chat (may limit collaboration)
4. Review data security implications
5. Click **Save** if changes are needed

## Recommendation

Most organizations should **enable** meeting chat for guests to support effective collaboration, while ensuring:
- Compliance policies cover guest chat
- Users are trained on sharing sensitive information
- Data loss prevention (DLP) policies are in place

## Learn More

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Guest meeting settings](https://learn.microsoft.com/en-us/microsoftteams/guest-access#manage-guest-access)
- [Teams compliance and security](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
