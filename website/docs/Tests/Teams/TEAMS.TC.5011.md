---
title: TEAMS.TC.5011 - Auto-admitted users should be restricted
description: Ensures auto-admitted users setting is properly restricted to prevent unauthorized access
---
## Auto-admitted users should be restricted

## Description

The auto-admitted users setting must be properly restricted in Microsoft Teams meetings to prevent unauthorized access. This setting controls who can bypass the meeting lobby and join directly without waiting for admission by the organizer.

**Acceptable Settings:**

The setting should be configured to one of these secure options:
- **EveryoneInCompany** - Only authenticated users from your organization are auto-admitted
- **OrganizerOnly** - Only the meeting organizer bypasses the lobby
- **InvitedUsers** - Only users specifically invited to the meeting are auto-admitted

**Risky Settings:**

- **Everyone** - All participants, including external and anonymous users, bypass the lobby (NOT RECOMMENDED)

:::warning Security Risk
If set to "Everyone," any participant with the meeting link can join directly without screening, including potential bad actors, uninvited guests, or malicious users.
:::

## How to fix

### Configure Auto-Admitted Users in Teams Admin Center

1. Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Participants & guests**, locate **Automatically admit people**
4. Set this option to one of the following secure settings:
   - **People in my organization** (EveryoneInCompany) - Recommended for most organizations
   - **Organizer only** (OrganizerOnly) - Most restrictive, requires manual admission
   - **People I invite** (InvitedUsers) - Balanced approach for meetings with known participants
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current auto-admitted users setting
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AutoAdmittedUsers

# Set to EveryoneInCompany (recommended)
Set-CsTeamsMeetingPolicy -Identity Global -AutoAdmittedUsers EveryoneInCompany

# Verify the change
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AutoAdmittedUsers
```

## Setting Recommendations

### EveryoneInCompany (Recommended for most organizations)
- ✅ Internal users join immediately
- ✅ External users wait in lobby for screening
- ✅ Balance of security and convenience
- ⚠️ External participants may experience slight delay

### OrganizerOnly (Maximum security)
- ✅ Highest security - all participants screened
- ✅ Complete control over meeting access
- ✅ Best for sensitive meetings
- ⚠️ Organizer must admit all participants manually
- ⚠️ Can delay meeting start if organizer is late

### InvitedUsers (Selective admission)
- ✅ Invited participants join immediately
- ✅ Uninvited participants wait in lobby
- ✅ Good for scheduled meetings with known attendees
- ⚠️ Requires proper calendar invitation management

## Impact

Restricting auto-admitted users will:
- ✅ Prevent unauthorized meeting access
- ✅ Enable screening of external participants
- ✅ Reduce risk of meeting disruption
- ✅ Improve meeting security posture
- ⚠️ External participants may wait in lobby

:::info Meeting Lobby
Participants in the lobby can see the meeting title and wait for admission. The organizer receives notifications when participants are waiting and can admit or deny them individually or in bulk.
:::

## Related tests

- [TEAMS.TC.5006 - Anonymous Join Meeting](./TEAMS.TC.5006.md)
- [TEAMS.TC.5007 - Anonymous Start Meeting](./TEAMS.TC.5007.md)

## Related links

* [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
* [Control who can bypass the meeting lobby](https://learn.microsoft.com/microsoftteams/who-can-bypass-meeting-lobby)
* [Manage meeting policies - Participants and guests](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests)
* [Teams meeting lobby best practices](https://learn.microsoft.com/microsoftteams/manage-lobby-policies)
* [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)
* [Set-CsTeamsMeetingPolicy](https://learn.microsoft.com/powershell/module/teams/set-csteamsmeetingpolicy)
