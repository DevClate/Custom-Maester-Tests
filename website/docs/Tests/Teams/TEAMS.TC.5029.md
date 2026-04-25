---
title: TEAMS.TC.5029 - Guests should not control transcription
description: Ensures guests cannot control meeting transcription to prevent unauthorized data capture
---

# TEAMS.TC.5029 - Guest Transcription

## Description

This test checks if transcription control is disabled for guest users in Microsoft Teams.

## Policy Statement

Contoso's company policy requires that guests cannot control meeting transcription to prevent unauthorized data capture and maintain control over sensitive meeting content. Transcriptions create searchable records of meeting conversations that could contain confidential information.

## Why This Matters

- **Data Security:** Transcriptions create permanent, searchable records of conversations
- **Content Control:** Organizations should control what meeting content is captured
- **Sensitive Information:** Meetings may contain confidential business information
- **Compliance:** Transcription may have regulatory implications
- **Data Distribution:** Guests may download or share transcription content
- **Intellectual Property:** Meeting discussions may contain proprietary information

## Risks of Guest Transcription Control

When guests can control transcription:
- **Unauthorized Recording:** Guests could capture meeting content without consent
- **Data Exfiltration:** Transcriptions can be downloaded and shared externally
- **Searchable Records:** Creates permanent, searchable text of meetings
- **Context Loss:** Transcriptions may lose important context or nuance
- **Compliance Issues:** May violate data retention or privacy policies
- **Legal Risks:** Transcriptions could be used in legal proceedings

## What Transcriptions Contain

Transcriptions include:
- Full text of meeting conversations
- Speaker identification
- Timestamps
- Searchable keywords
- Downloadable and shareable format
- Persistent storage

## Remediation Steps

1. Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
2. Under **Meetings** section, find **Allow transcription**
3. Set this to **Off**
4. Click **Save**

## Who Should Control Transcription

**Internal Users:**
- Control transcription start/stop
- Manage transcription retention
- Determine transcription sharing
- Ensure compliance with policies
- Protect sensitive content

**Guests:**
- Should not control transcription
- Can view transcriptions if shared
- Follow organizational policies
- Respect confidential information

## Best Practices

- Only enable transcription when necessary
- Inform participants when transcription is active
- Follow data retention policies
- Protect transcription files appropriately
- Review transcriptions before sharing
- Consider compliance and legal requirements

## Learn More

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Teams meeting transcription](https://learn.microsoft.com/en-us/microsoftteams/meeting-transcription-captions)
- [Guest meeting settings](https://learn.microsoft.com/en-us/microsoftteams/guest-access#manage-guest-access)
- [Teams compliance features](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
