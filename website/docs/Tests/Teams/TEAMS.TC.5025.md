---
title: TEAMS.TC.5025 - Guest IP video settings should be reviewed
description: Reviews guest IP video permissions based on organizational requirements
---

# TEAMS.TC.5025 - Guest IP Video

## Description

This test reviews the guest IP video setting in Microsoft Teams.

## Policy Statement

Contoso's company policy recommends reviewing guest IP video permissions based on organizational security and collaboration requirements. IP video for guests is typically allowed to enable full meeting participation, but organizations with specific security or bandwidth concerns may choose to disable this feature.

## Why This Matters

This is an **informational test** that reports the current configuration for organizational review.

IP video for guests enables visual communication in meetings but should be reviewed based on:

- **Collaboration Needs:** Video enhances meeting participation and engagement
- **Bandwidth Concerns:** Video consumption may impact network performance
- **Security Requirements:** Some industries restrict video for compliance
- **Privacy Considerations:** Video may capture sensitive environments
- **Meeting Experience:** Disabling video may reduce meeting effectiveness

## Configuration Options

- **Enabled (Typical):** Guests can use video in meetings - recommended for collaboration
- **Disabled:** Guests cannot use video - may impact meeting experience

## Review Considerations

**Reasons to Enable:**
- Full meeting participation and collaboration
- Visual communication improves understanding
- Standard for most business environments
- Enhances guest experience

**Reasons to Disable:**
- Bandwidth limitations in network
- Specific security or compliance requirements
- Industry regulations restricting video
- Privacy concerns in sensitive environments

## Configuration Steps

1. Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
2. Under **Meetings** section, review **Allow IP video**
3. Consider your organization's collaboration and security needs
4. Click **Save** if changes are needed

## Recommendation

Most organizations should **enable** IP video for guests to support effective collaboration. Only disable if specific security, compliance, or bandwidth concerns require it.

## Learn More

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Guest meeting settings](https://learn.microsoft.com/en-us/microsoftteams/guest-access#manage-guest-access)
- [Teams meeting features](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-audio-and-video)
