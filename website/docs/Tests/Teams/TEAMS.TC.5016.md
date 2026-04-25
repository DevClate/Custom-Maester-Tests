---
sidebar_label: "TEAMS.TC.5016"
title: TEAMS.TC.5016 - Chat Data Protection
---

# TEAMS.TC.5016 - Chat Data Protection

## Description

This test checks if Teams chat settings are configured to protect sensitive data from leaking to external services.

## Policy Statement

Contoso's company policy requires chat features that may expose data to external services to be carefully reviewed.

## Why This Matters

Several Teams chat features send data to external services for processing:
- **URL Previews** - URLs sent to preview generation services
- **Message Translation** - Messages sent to Microsoft translation services
- **Giphy** - Content retrieved from Giphy service
- **Immersive Reader** - Text sent to accessibility service

For organizations handling sensitive data, these features can inadvertently leak information.

## Test Checks

### 1. URL Previews (AllowUrlPreviews)

**What it does:**
When users share a URL in chat, Teams sends the URL to an external service to generate a rich preview card.

**Security risk:**
URLs may contain sensitive information:
- SharePoint document IDs: `https://contoso.sharepoint.com/sites/Confidential/Project-Phoenix-2025.docx`
- Internal system names: `https://internal-hr-system.contoso.com/salary-review`
- Access tokens: `https://app.contoso.com/report?token=abc123`

**When to disable:**
- Financial services
- Healthcare (HIPAA)
- Legal firms
- Government agencies
- Any organization handling confidential data

### 2. Message Translation (AllowUserTranslation)

**What it does:**
Allows users to translate messages to their preferred language.

**Security risk:**
Messages are sent to Microsoft's translation service for processing. Sensitive chat content may be exposed.

**Consider disabling if:**
- Chats contain highly sensitive data
- Compliance requires all data processing on-premises
- Privacy regulations restrict external processing

**Consider enabling if:**
- Global organization with multilingual teams
- Accessibility is a priority
- Sensitivity of chat data is low

### 3. Giphy Integration (AllowGiphy)

**What it does:**
Users can insert animated GIFs from Giphy into chats.

**Considerations:**
- May not be appropriate for professional environments
- Content rating can be controlled (Strict, Moderate)
- External content in corporate communications

### 4. Immersive Reader (AllowImmersiveReader)

**What it does:**
Provides accessibility features like text-to-speech and reading comprehension tools.

**Consideration:**
Balance accessibility needs with data sensitivity.

## How to Fix

### Disable URL Previews (Recommended for Sensitive Data)

```powershell
Set-CsTeamsClientConfiguration -AllowUrlPreviews $false
```

**Verify:**
```powershell
Get-CsTeamsClientConfiguration | Select-Object AllowUrlPreviews
```

### Control Message Translation

```powershell
# Disable translation
Set-CsTeamsMessagingPolicy -Identity Global -AllowUserTranslation $false

# Enable translation (if appropriate)
Set-CsTeamsMessagingPolicy -Identity Global -AllowUserTranslation $true
```

### Control Giphy

```powershell
# Disable Giphy completely
Set-CsTeamsMessagingPolicy -Identity Global -AllowGiphy $false

# Enable with strict content rating
Set-CsTeamsMessagingPolicy -Identity Global -AllowGiphy $true -GiphyRatingType Strict
```

### Control Immersive Reader

```powershell
Set-CsTeamsClientConfiguration -AllowImmersiveReader $false
```

## Decision Matrix

| Feature | Financial Services | Healthcare | Education | General Business |
|---------|-------------------|------------|-----------|------------------|
| URL Previews | ❌ Disable | ❌ Disable | ✅ Enable | ⚠️ Review |
| Translation | ⚠️ Review | ❌ Disable | ✅ Enable | ✅ Enable |
| Giphy | ❌ Disable | ❌ Disable | ⚠️ Strict Rating | ⚠️ Moderate Rating |
| Immersive Reader | ⚠️ Review | ⚠️ Review | ✅ Enable | ✅ Enable |

## Verify Current Settings

```powershell
# Check all relevant settings
$clientConfig = Get-CsTeamsClientConfiguration
$messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global

Write-Host "URL Previews: $($clientConfig.AllowUrlPreviews)"
Write-Host "Message Translation: $($messagingPolicy.AllowUserTranslation)"
Write-Host "Giphy: $($messagingPolicy.AllowGiphy)"
Write-Host "Giphy Rating: $($messagingPolicy.GiphyRatingType)"
Write-Host "Immersive Reader: $($clientConfig.AllowImmersiveReader)"
```

## Impact Assessment

Before disabling features:
1. **Survey users** - Understand which features are actively used
2. **Pilot with one team** - Test impact before org-wide change
3. **Communicate changes** - Explain why features are being disabled
4. **Provide alternatives** - If disabling translation, consider other solutions

## Learn More

- [Manage Teams client configuration](https://learn.microsoft.com/microsoftteams/manage-teams-skypeforbusiness-admin-center)
- [Manage messaging policies in Teams](https://learn.microsoft.com/microsoftteams/messaging-policies-in-teams)
- [Data privacy in Teams](https://learn.microsoft.com/microsoftteams/teams-privacy)
- [Security and compliance in Teams](https://learn.microsoft.com/microsoftteams/security-compliance-overview)
