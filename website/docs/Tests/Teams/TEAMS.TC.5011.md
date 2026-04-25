---
sidebar_label: "TEAMS.TC.5011"
title: TEAMS.TC.5011 - Broadcast Transcription Settings
---

# TEAMS.TC.5011 - Broadcast Transcription Settings

## Description

This test checks if broadcast transcription settings are appropriate for your organization.

## Policy Statement

Contoso's company policy requires broadcast transcription to be reviewed based on accessibility and compliance requirements.

## Why This Matters

Broadcast transcription can improve accessibility for attendees but may have implications for:
- **Data storage** - Additional storage requirements for transcriptions
- **Compliance** - Some regulations may require or prohibit transcription
- **Privacy** - Transcriptions may contain sensitive information
- **Accessibility** - Improves experience for attendees with hearing impairments

## How to Fix

### Review Current Configuration

1. Navigate to [Teams Admin Center - Broadcast Policies](https://admin.teams.microsoft.com/policies/broadcast)
2. Review the **AllowBroadcastTranscription** setting in the Global policy
3. Evaluate based on your organization's needs

### Considerations

**Enable transcription when:**
- Accessibility is a priority
- You have robust data retention policies
- Compliance requirements mandate transcription
- You have adequate storage capacity

**Disable transcription when:**
- Privacy concerns outweigh accessibility benefits
- Regulations prohibit recording/transcription
- Storage costs are prohibitive
- Content is highly sensitive

### PowerShell Verification

```powershell
# Check current setting
Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object AllowBroadcastTranscription

# Enable broadcast transcription
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -AllowBroadcastTranscription $true

# Disable broadcast transcription
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -AllowBroadcastTranscription $false
```

## Learn More

- [Configure Teams live events settings](https://learn.microsoft.com/microsoftteams/teams-live-events/configure-teams-live-events)
- [Teams broadcast policies](https://learn.microsoft.com/microsoftteams/teams-live-events/set-up-for-teams-live-events)
