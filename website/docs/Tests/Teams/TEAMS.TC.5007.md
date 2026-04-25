---
title: TEAMS.TC.5007 - Anonymous users should not start meetings
description: Ensures anonymous users are restricted from starting Teams meetings
---
## Anonymous users should not be allowed to start meetings

## Description

Anonymous users should not be allowed to start Microsoft Teams meetings to prevent unauthorized individuals from creating meetings in your organization's Teams environment. Meeting control should remain with authenticated users who can be held accountable.

**Security Concerns:**

When anonymous users can start meetings:
- Unauthenticated users can create meetings in your tenant
- No accountability for meeting creators
- Risk of creating meetings for malicious purposes
- Potential for resource abuse
- Difficulty tracking meeting ownership

:::warning Security Risk
Allowing anonymous users to start meetings gives unauthorized individuals the ability to create meetings in your organization's environment without any authentication or accountability.
:::

## How to fix

### Disable Anonymous Start Meeting in Teams Admin Center

1. Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Participants & guests**, locate **Let anonymous people start a meeting**
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check current anonymous start meeting setting
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowAnonymousUsersToStartMeeting

# Disable anonymous start meeting
Set-CsTeamsMeetingPolicy -Identity Global -AllowAnonymousUsersToStartMeeting $false

# Verify the change
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowAnonymousUsersToStartMeeting
```

## Impact

Disabling anonymous start meeting will:
- ✅ Ensure only authenticated users can start meetings
- ✅ Maintain accountability for meeting creators
- ✅ Prevent unauthorized meeting creation
- ⚠️ Meetings require an authenticated organizer to start

:::info
With this setting disabled, scheduled meetings will wait in a pre-meeting lobby until an authenticated organizer joins and starts the meeting.
:::

## Related tests

- [TEAMS.TC.5006 - Anonymous Join Meeting](./TEAMS.TC.5006.md)
- [TEAMS.TC.5008 - Anonymous Dial Out](./TEAMS.TC.5008.md)

## Related links

* [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
* [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
* [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)
* [Set-CsTeamsMeetingPolicy](https://learn.microsoft.com/powershell/module/teams/set-csteamsmeetingpolicy)
