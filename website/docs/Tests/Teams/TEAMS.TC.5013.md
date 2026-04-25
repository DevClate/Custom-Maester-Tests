---
title: TEAMS.TC.5013 - Data Loss Prevention for Teams
description: Provides guidance on configuring DLP policies to protect sensitive data in Teams
---

# TEAMS.TC.5013 - Data Loss Prevention for Teams

## Description

This informational test provides guidance on configuring Data Loss Prevention (DLP) policies for Microsoft Teams.

## Policy Statement

Contoso's company policy requires DLP policies to be configured to protect sensitive information shared in Teams.

## Why This Matters

Teams is a collaboration platform where sensitive data is frequently shared:
- Credit card numbers in chat messages
- Social Security Numbers in channel posts
- Confidential documents uploaded to chats
- Patient health information in healthcare settings
- Financial data in banking environments

Without DLP policies, this sensitive data can be:
- Accidentally shared with unauthorized users
- Exposed to guest users
- Sent to external collaborators
- Downloaded to unmanaged devices

## How to Fix

### 1. Access Microsoft Purview

Navigate to [Microsoft Purview - Data Loss Prevention](https://compliance.microsoft.com/datalossprevention)

### 2. Create a DLP Policy for Teams

1. Click **Policies** → **Create policy**
2. Choose a template or start from scratch
3. **Select locations**: Include **Teams chat and channel messages**
4. Define rules with sensitive information types:
   - Credit card numbers
   - Social Security Numbers
   - Passport numbers
   - Health records
   - Financial data

### 3. Configure Actions

Choose how DLP should respond when sensitive content is detected:
- **Notify users** with policy tips
- **Block sharing** immediately
- **Generate alerts** for security team
- **Require business justification**

### 4. Test in Audit Mode

Before enforcing:
```
1. Enable policy in "Test it out first" mode
2. Monitor for false positives (2-4 weeks)
3. Adjust rules and exceptions
4. Enable enforcement when confident
```

### 5. Monitor and Tune

- Review DLP alerts regularly in the Purview portal
- Analyze policy match reports
- Adjust sensitivity as needed
- Provide user training on policy tips

## Recommended DLP Policies

### Policy 1: Financial Data Protection
- **Scope**: All Teams
- **Content**: Credit cards, bank accounts, routing numbers
- **Action**: Block + notify

### Policy 2: Personal Information
- **Scope**: All Teams
- **Content**: SSN, driver's license, passport
- **Action**: Block + notify

### Policy 3: Health Information (HIPAA)
- **Scope**: All Teams
- **Content**: Medical records, patient IDs
- **Action**: Block + audit

### Policy 4: Intellectual Property
- **Scope**: Teams with guests
- **Content**: Custom keywords (e.g., "Project Phoenix", "Confidential")
- **Action**: Restrict sharing with guests

## Verify Configuration

Since DLP policies are managed in Microsoft Purview (not Teams PowerShell), verification requires manual review:

1. Check [DLP Policies](https://compliance.microsoft.com/datalossprevention)
2. Verify policies include Teams as a location
3. Confirm rules are active (not in test mode)
4. Review recent alerts and incidents

## Learn More

- [DLP for Microsoft Teams](https://learn.microsoft.com/purview/dlp-microsoft-teams)
- [Create and configure DLP policies](https://learn.microsoft.com/purview/create-test-tune-dlp-policy)
- [DLP policy tips](https://learn.microsoft.com/purview/use-notifications-and-policy-tips)
- [Sensitive information types](https://learn.microsoft.com/purview/sensitive-information-type-learn-about)
