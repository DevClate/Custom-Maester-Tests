---
title: TEAMS.TC.5044 - Stickers should be disabled
description: Ensures stickers are disabled to prevent inappropriate content sharing
---

# TEAMS.TC.5044 - Stickers Should Be Disabled

## Description

This test checks if stickers are disabled in Microsoft Teams messaging policies.

## Policy Statement

Contoso's company policy requires stickers to be disabled as they can contain inappropriate content and are unprofessional in business communications. This is important for maintaining a professional workplace environment.

## Why This Matters

Stickers add visual elements to conversations but can introduce risks including inappropriate content, copyright violations, and reduced professionalism in business communications:

- **Content Control:** Prevents inappropriate image sharing
- **Professionalism:** Maintains business communication standards
- **Copyright:** Avoids potential copyright violations
- **Compliance:** Reduces risk of offensive content
- **Productivity:** Minimizes distractions in work conversations
- **HR Risk:** Prevents harassment or discrimination via images
- **Reputation:** Protects organizational image

## Security and Compliance Risks

When stickers are enabled:
- Users may share inappropriate or offensive content
- Copyright violations may occur with third-party stickers
- Content moderation becomes more challenging
- Unprofessional communication may increase
- HR incidents may arise from offensive images
- Difficult to audit or control image content
- Brand reputation risks increase
- Bandwidth consumed by image transfers

## Common Issues

### Content Risks:
- **Offensive Material:** Inappropriate or discriminatory images
- **Copyright Violations:** Unlicensed character images
- **Cultural Insensitivity:** Images offensive to some cultures
- **Workplace Harassment:** Images used to harass or intimidate
- **Inappropriate Humor:** Content not suitable for workplace

### Business Impact:
- Reduced professionalism in communications
- Distraction from business objectives
- HR investigations and incidents
- Potential legal exposure
- Brand reputation damage

## Remediation Steps

1. Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
2. Select the **Global (Org-wide default)** policy
3. Under **Content** section, find **Use stickers**
4. Set this to **Off**
5. Click **Save**

## User Impact

After disabling stickers:
- Sticker option removed from message composer
- Existing stickers in messages remain visible
- Users must use text or other approved methods
- More professional communication environment
- Reduced risk of inappropriate content

## Business Considerations

Disabling stickers:
- Maintains professional communication standards
- Reduces HR and compliance risks
- Simplifies content moderation
- Minimizes copyright concerns
- Keeps conversations focused on business
- Eliminates bandwidth waste on decorative content

Organizations with casual cultures may choose to enable stickers while implementing:
- Clear usage policies
- User training on appropriate content
- Monitoring and reporting mechanisms
- Swift action on policy violations
- Approved sticker packs only

## Alternative Approaches

Instead of stickers, organizations can:
- Use built-in emoji (more controlled)
- Implement approved GIF libraries
- Utilize Teams reactions
- Focus on text-based communication
- Use formatted messages for emphasis

## Learn More

- [Manage messaging policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Teams security and compliance](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
- [Content moderation in Teams](https://learn.microsoft.com/en-us/microsoftteams/communication-compliance)
- [Teams governance planning](https://learn.microsoft.com/en-us/microsoftteams/plan-teams-governance)
