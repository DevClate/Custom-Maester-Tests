---
title: TEAMS.TC.5024 - Giphy content rating should be set to Strict if enabled
description: Ensures Giphy content rating is set to Strict to prevent inappropriate content
---

# TEAMS.TC.5024 - Giphy Content Rating

## Description

This test checks if Giphy content rating is set to Strict when Giphy is enabled in Microsoft Teams.

## Policy Statement

Contoso's company policy requires Giphy content rating to be set to Strict if Giphy is enabled to prevent inappropriate or offensive content from being shared in Teams conversations. The Strict setting applies the most restrictive content filtering.

## Why This Matters

- **Workplace Appropriateness:** Prevents offensive or NSFW content in professional communication
- **Harassment Prevention:** Reduces risk of sharing inappropriate content that could constitute harassment
- **Professional Environment:** Maintains professional standards in workplace communications
- **Compliance:** Helps meet organizational content policies
- **Reputation Protection:** Prevents inappropriate content in client-facing channels

## Content Rating Options

- **Strict:** Most restrictive - filters out potentially inappropriate content (recommended)
- **Moderate:** Moderate filtering - some adult content may appear
- **Disabled:** Giphy feature is completely disabled

## Remediation Steps

1. Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
2. Select the **Global (Org-wide default)** policy
3. Under **Gifs and stickers** section:
   - If **Use Giphys in conversations** is **On**, set **Giphy content rating** to **Strict**
   - Or consider disabling Giphy entirely by setting **Use Giphys in conversations** to **Off**
4. Click **Save**

## Alternative Approach

Organizations may choose to completely disable Giphy if:
- Content filtering is not sufficient for organizational policies
- Compliance requirements prohibit third-party content
- Bandwidth or productivity concerns exist
- Industry regulations require strict content controls

## Learn More

- [Manage messaging policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Use Giphy in Teams conversations](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams#giphy-settings)
- [Teams messaging policy settings](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
