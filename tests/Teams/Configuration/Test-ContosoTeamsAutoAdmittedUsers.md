This test checks if the auto-admitted users setting is properly restricted in Microsoft Teams meetings.

Contoso's company policy requires that auto-admitted users must be restricted to **EveryoneInCompany**, **OrganizerOnly**, or **InvitedUsers** to prevent unauthorized access to meetings. This setting controls who can bypass the meeting lobby and join directly.

**Acceptable Settings:**
- **EveryoneInCompany** - Only authenticated users from your organization are auto-admitted
- **OrganizerOnly** - Only the meeting organizer is auto-admitted
- **InvitedUsers** - Only users specifically invited to the meeting are auto-admitted

**To remediate this issue:**

- Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the **Global (Org-wide default)** policy
- Under **Participants & guests**, locate **Automatically admit people**
- Set this option to one of the following:
  - **People in my organization** (EveryoneInCompany)
  - **Organizer only** (OrganizerOnly)
  - **People I invite** (InvitedUsers)
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Learn more:**

- [Control who can bypass the meeting lobby](https://learn.microsoft.com/microsoftteams/who-can-bypass-meeting-lobby)
- [Manage meeting policies - Participants and guests](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)

<!--- Results --->

%TestResult%
