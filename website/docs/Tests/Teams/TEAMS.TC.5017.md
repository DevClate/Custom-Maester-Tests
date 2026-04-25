---
sidebar_label: "TEAMS.TC.5017"
title: TEAMS.TC.5017 - Broadcast Attendee Visibility
---

# TEAMS.TC.5017 - Broadcast Attendee Visibility

## Description

This test checks if broadcast attendee visibility is configured to protect attendee privacy.

## Policy Statement

Contoso's company policy requires broadcast attendee visibility to be restricted to protect privacy.

## Why This Matters

Exposing attendee lists in live events can create several risks:

### Privacy Concerns
- Reveals who is interested in specific topics
- May expose sensitive relationships
- Can enable unwanted contact between attendees
- May violate privacy expectations

### Security Risks
- Attackers can identify high-value targets
- Social engineering opportunities
- Phishing potential (contact attendees of security event)

### Professional Concerns
- Competitive intelligence (competitors see who attends)
- Internal politics (who attended layoff announcement?)
- Unwanted networking pressure

## Test Criteria

**This test fails if:**
- `BroadcastAttendeeVisibilityMode` is set to `EveryoneInCompany`

**This allows all attendees to see each other**, which creates the privacy risks described above.

## How to Fix

### Recommended Configuration

Set attendee visibility to a more restrictive option:

```powershell
# Recommended: Only invited users can see attendee list
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -BroadcastAttendeeVisibilityMode InvitedUsersInCompany
```

### Configuration Options

#### InvitedUsersInCompany (Recommended)
Only users who were explicitly invited can see the attendee list.

**Best for:**
- Most organizations
- Events with sensitive topics
- Default security posture

#### AnonymousUsers
Attendees are anonymous - nobody can see the attendee list.

**Best for:**
- Highly sensitive topics (HR, legal)
- External events with guests
- Maximum privacy protection

**Downside:**
- Reduces networking opportunities
- No attendee analytics

#### EveryoneInCompany (Not Recommended)
All attendees can see each other.

**Only appropriate for:**
- Public events (already announced)
- Networking events where visibility is desired
- Internal town halls with no sensitive content

## Verify Current Setting

```powershell
Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object BroadcastAttendeeVisibilityMode
```

## Use Cases

### Example 1: Executive Town Hall
**Scenario:** CEO quarterly update to entire company  
**Visibility:** `EveryoneInCompany` (acceptable - public internal event)

### Example 2: Product Launch (Confidential)
**Scenario:** Pre-announcement briefing for Project Phoenix  
**Visibility:** `InvitedUsersInCompany` (recommended - need-to-know basis)

### Example 3: HR Policy Changes
**Scenario:** Discussion of layoffs or reorganization  
**Visibility:** `AnonymousUsers` (required - highly sensitive)

### Example 4: Customer Webinar
**Scenario:** External customers attending product demo  
**Visibility:** `AnonymousUsers` (required - external guests)

## Advanced Configuration

Create different policies for different event types:

```powershell
# Public events policy
New-CsTeamsMeetingBroadcastPolicy -Identity "PublicBroadcasts" `
    -BroadcastAttendeeVisibilityMode EveryoneInCompany

# Confidential events policy
New-CsTeamsMeetingBroadcastPolicy -Identity "ConfidentialBroadcasts" `
    -BroadcastAttendeeVisibilityMode InvitedUsersInCompany

# Highly sensitive events policy
New-CsTeamsMeetingBroadcastPolicy -Identity "SensitiveBroadcasts" `
    -BroadcastAttendeeVisibilityMode AnonymousUsers

# Assign to organizers as needed
Grant-CsTeamsMeetingBroadcastPolicy -Identity "hr-admin@contoso.com" -PolicyName "SensitiveBroadcasts"
```

## Compliance Considerations

- **GDPR**: May require anonymity for certain events
- **Healthcare (HIPAA)**: Patient-facing events should be anonymous
- **Financial Services**: May need to restrict visibility for insider trading concerns
- **Legal**: Attorney-client events should prioritize privacy

## Related Tests

- [TEAMS.TC.5011 - Broadcast Transcription Settings](TEAMS.TC.5011.md)
- [TEAMS.TC.5015 - Broadcast Recording Settings](TEAMS.TC.5015.md)

## Learn More

- [Teams broadcast policies](https://learn.microsoft.com/microsoftteams/teams-live-events/set-up-for-teams-live-events)
- [Configure live events settings](https://learn.microsoft.com/microsoftteams/teams-live-events/configure-teams-live-events)
- [Privacy in Teams live events](https://learn.microsoft.com/microsoftteams/teams-live-events/plan-for-teams-live-events)
