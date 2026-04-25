---
sidebar_label: "TEAMS.TC.5014"
title: TEAMS.TC.5014 - Channel Meeting Scheduling
---

# TEAMS.TC.5014 - Channel Meeting Scheduling

## Description

This test checks if channel meeting scheduling is appropriately configured for your organization.

## Policy Statement

Contoso's company policy requires channel meeting scheduling to be reviewed to ensure proper governance.

## Why This Matters

Channel meetings differ from private meetings:

### Channel Meetings
- Visible to all channel members
- Appear in channel calendar
- More transparent and discoverable
- Automatically include all channel members
- Meeting recordings posted to channel

### Private Meetings
- Only visible to invited participants
- Private calendar entries
- More controlled attendance
- Selective participant list

Organizations need to determine which approach aligns with their collaboration and governance needs.

## How to Fix

### Review Current Setting

```powershell
Get-CsTeamsMeetingPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object AllowChannelMeetingScheduling
```

### Enable Channel Meeting Scheduling

If your organization values transparency and broad collaboration:

```powershell
Set-CsTeamsMeetingPolicy -Identity Global -AllowChannelMeetingScheduling $true
```

**Benefits:**
- Increases meeting visibility
- Reduces duplicate meetings
- Improves team coordination
- Easier for team members to discover and join

**Considerations:**
- May result in large meetings
- Less privacy for sensitive topics
- Potential for meeting sprawl

### Disable Channel Meeting Scheduling

If your organization prefers controlled, private meetings:

```powershell
Set-CsTeamsMeetingPolicy -Identity Global -AllowChannelMeetingScheduling $false
```

**Benefits:**
- More controlled attendance
- Better privacy for sensitive topics
- Reduces meeting sprawl
- More intentional meeting creation

**Considerations:**
- Reduced transparency
- Potential for duplicate meetings
- Requires manual invitation management

## Configuration Options

### Hybrid Approach

Create different policies for different user groups:

```powershell
# Marketing team - Enable channel meetings (collaborative)
New-CsTeamsMeetingPolicy -Identity "MarketingMeetings" -AllowChannelMeetingScheduling $true
Grant-CsTeamsMeetingPolicy -Group "Marketing" -PolicyName "MarketingMeetings"

# Executive team - Disable channel meetings (privacy)
New-CsTeamsMeetingPolicy -Identity "ExecutiveMeetings" -AllowChannelMeetingScheduling $false
Grant-CsTeamsMeetingPolicy -Group "Executives" -PolicyName "ExecutiveMeetings"
```

## Best Practices

1. **Assess organizational culture** - Collaborative vs. privacy-focused
2. **Consider industry regulations** - Healthcare, finance may need more privacy
3. **Pilot with one team** - Test before org-wide deployment
4. **Provide user guidance** - When to use channel vs. private meetings
5. **Monitor usage** - Review Teams analytics to understand patterns

## Learn More

- [Manage meeting policies in Teams](https://learn.microsoft.com/microsoftteams/meeting-policies-overview)
- [Channel meetings vs private meetings](https://learn.microsoft.com/microsoftteams/manage-meeting-policies)
- [Teams meeting policy reference](https://learn.microsoft.com/microsoftteams/meeting-policies-reference)
