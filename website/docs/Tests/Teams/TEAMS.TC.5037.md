---
title: TEAMS.TC.5037 - Outlook Add-In integration review
description: Review of Microsoft Teams Meeting Add-In for Outlook status
---

# TEAMS.TC.5037 - Outlook Add-In Integration Review

## Description

This informational test reviews the status of the Microsoft Teams Meeting Add-In for Outlook.

## Policy Statement

The Outlook add-in allows users to schedule Teams meetings directly from Outlook. This informational test reviews the integration status to ensure users have the expected meeting scheduling capabilities.

## Why This Matters

The Teams add-in for Outlook allows users to schedule Teams meetings directly from Outlook, providing seamless integration between the two platforms.

## Why This Matters

- **User Experience:** Simplifies meeting scheduling workflow
- **Productivity:** Reduces friction in creating Teams meetings
- **Adoption:** Encourages Teams usage through familiar interface
- **Integration:** Provides unified Microsoft 365 experience
- **Efficiency:** Streamlines calendar and meeting management
- **Accessibility:** Makes Teams meetings easy to schedule

## Integration Benefits

When the Outlook Add-In is enabled:
- Users schedule Teams meetings from Outlook calendar
- Meeting details automatically added to invitations
- Teams and Outlook calendars stay synchronized
- Reduces need to switch between applications
- Improves meeting organization
- Enhances user adoption

## Current Status Review

This test provides an informational review of whether the Outlook Add-In is currently enabled or disabled. Organizations should evaluate this setting based on their productivity requirements and user workflows.

**Consider enabling if:**
- Users primarily use Outlook for scheduling
- You want to improve Teams adoption
- Simplified meeting creation is desired
- Integration with Outlook is beneficial

**Consider disabling if:**
- Organization doesn't use Outlook
- Security concerns exist
- Alternative scheduling methods preferred
- Simplified interface without add-ins desired

## Configuration Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the appropriate policy
3. Under **General** section, find **Outlook Add-In**
4. Toggle **On** or **Off** based on your requirements
5. Click **Save**

**Note:** Changes may take up to 24 hours to propagate to users' Outlook clients.

## Troubleshooting

If add-in doesn't appear:
- Verify policy is enabled
- Wait 24 hours for policy propagation
- Check Outlook version compatibility
- Verify user has Teams license
- Clear Outlook cache
- Restart Outlook

## Learn More

- [Teams Meeting Add-In for Outlook](https://support.microsoft.com/en-us/office/use-the-teams-meeting-add-in-in-outlook-95b525ea-8a05-4ab4-9dea-bd93c3a11a7d)
- [Manage meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-in-teams)
- [Teams and Outlook integration](https://learn.microsoft.com/en-us/microsoftteams/teams-outlook-integration)
