---
title: TEAMS.TC.5006 - Anonymous users should not join meetings
description: Ensures anonymous users are restricted from joining Teams meetings
---
## Anonymous users should not be allowed to join meetings

## Description

Anonymous users should not be allowed to join Microsoft Teams meetings to reduce exposure to uninvited attendees and potential security threats. Organizations should use lobby controls and proper meeting authentication to manage external participants.

**Security Concerns:**

When anonymous join is enabled:
- Anyone with the meeting link can join without authentication
- No identity verification is performed
- Tracking and auditing of participants becomes difficult
- Risk of meeting disruption and data exposure increases
- Potential for unauthorized recording or information gathering

:::warning Security Risk
Allowing anonymous join exposes your meetings to anyone with the meeting link, including potential bad actors who could disrupt meetings or gather sensitive information.
:::

## How to fix

### Disable Anonymous Join in Teams Admin Center

1. Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Participants & guests**, locate **Let anonymous people join a meeting**
4. Set this option to **Off**
5. Click **Save**

### Alternative: Configure Lobby Controls

If your organization requires external meeting access, configure proper lobby controls instead:

1. In the same **Global** meeting policy
2. Set **Automatically admit people** to:
   - **People in my organization** (recommended) - Only internal users bypass lobby
   - **Organizer only** - All participants wait in lobby for admission
3. Ensure **Always let callers bypass the lobby** is set to **Off**
4. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current anonymous join setting
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowAnonymousUsersToJoinMeeting

# Disable anonymous join
Set-CsTeamsMeetingPolicy -Identity Global -AllowAnonymousUsersToJoinMeeting $false

# Verify the change
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowAnonymousUsersToJoinMeeting
```

## Impact

Disabling anonymous join will:
- ✅ Require authentication for all meeting participants
- ✅ Improve meeting participant tracking and auditing
- ✅ Reduce risk of meeting disruption
- ⚠️ External guests must sign in or wait in lobby for admission

:::info Best Practice
For meetings with external participants, use lobby controls to screen attendees before admission rather than allowing anonymous join.
:::

## Related tests

- [TEAMS.TC.5007 - Anonymous Start Meeting](./TEAMS.TC.5007.md)
- [TEAMS.TC.5008 - Anonymous Dial Out](./TEAMS.TC.5008.md)
- [TEAMS.TC.5011 - Auto Admitted Users](./TEAMS.TC.5011.md)

## Related links

* [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
* [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
* [Control who can bypass the meeting lobby](https://learn.microsoft.com/microsoftteams/who-can-bypass-meeting-lobby)
* [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)
* [Set-CsTeamsMeetingPolicy](https://learn.microsoft.com/powershell/module/teams/set-csteamsmeetingpolicy)
