---
sidebar_label: "TEAMS.TC.5015"
title: TEAMS.TC.5015 - Broadcast Recording Settings
---

# TEAMS.TC.5015 - Broadcast Recording Settings

## Description

This test checks if broadcast recording settings are appropriate for your organization.

## Policy Statement

Contoso's company policy requires broadcast recording settings to be reviewed based on compliance and data retention requirements.

## Why This Matters

Recording live events has significant implications:

### Compliance Considerations
- Some regulations **require** recording (financial services, legal)
- Other regulations **prohibit** recording (privacy laws in certain jurisdictions)
- Healthcare may have HIPAA requirements

### Storage Impact
- Live event recordings are large (GB per hour)
- Long-term retention increases storage costs
- OneDrive/SharePoint quotas may be impacted

### Privacy Concerns
- Recordings may capture sensitive discussions
- Access control becomes critical
- Retention periods must be defined

### Legal Implications
- Recordings can be subpoenaed
- May create legal liability
- Require proper disclosure to attendees

## How to Fix

### Review Current Setting

```powershell
Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object BroadcastRecordingMode
```

### Configuration Options

#### 1. Always Record (Compliance-Driven)

Best for organizations with compliance requirements:

```powershell
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -BroadcastRecordingMode Always
```

**Use when:**
- Regulations require recording
- Training/educational content needs archiving
- Organization has robust storage infrastructure
- Clear retention policies are in place

#### 2. Organizer Chooses (Flexible)

Most common approach:

```powershell
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -BroadcastRecordingMode UserOverride
```

**Use when:**
- Different events have different requirements
- Trust organizers to make appropriate decisions
- Want flexibility without org-wide mandates

#### 3. Never Record (Privacy-Focused)

Best for privacy-sensitive organizations:

```powershell
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -BroadcastRecordingMode AlwaysDisabled
```

**Use when:**
- Privacy regulations prohibit recording
- Storage costs are prohibitive
- Content is highly sensitive
- Legal risk outweighs benefits

## Best Practices

### If Recording is Enabled

1. **Define retention policy**
   - How long should recordings be kept?
   - Who approves deletion?
   - Where are recordings stored?

2. **Control access**
   - Who can view recordings?
   - How are permissions managed?
   - Is encryption required?

3. **Disclose to attendees**
   - Notify participants that recording is happening
   - Include in event description
   - Consider consent requirements

4. **Monitor storage usage**
   - Set up alerts for storage quotas
   - Review and purge old recordings
   - Consider archival solutions

### Audit Recording Usage

```powershell
# Review broadcast policies
Get-CsTeamsMeetingBroadcastPolicy

# Check who has been assigned custom policies
Get-CsOnlineUser | Select-Object DisplayName, BroadcastMeetingPolicy
```

## Related Tests

- [TEAMS.TC.5011 - Broadcast Transcription Settings](TEAMS.TC.5011.md)
- [TEAMS.TC.5017 - Broadcast Attendee Visibility](TEAMS.TC.5017.md)

## Learn More

- [Configure Teams live events settings](https://learn.microsoft.com/microsoftteams/teams-live-events/configure-teams-live-events)
- [Teams broadcast policies](https://learn.microsoft.com/microsoftteams/teams-live-events/set-up-for-teams-live-events)
- [Recording storage and compliance](https://learn.microsoft.com/microsoftteams/tmr-meeting-recording-change)
- [Teams storage architecture](https://learn.microsoft.com/microsoftteams/location-of-data-in-teams)
