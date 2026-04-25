This test checks if anonymous users are restricted from joining Microsoft Teams meetings.

Contoso's company policy requires that anonymous users should not be allowed to join meetings to reduce exposure to uninvited attendees and potential security threats. Organizations should use lobby controls and proper meeting authentication instead.

**To remediate this issue:**

- Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the **Global (Org-wide default)** policy
- Under **Participants & guests**, locate **Let anonymous people join a meeting**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Alternative approach:** If your organization requires external meeting access, configure proper lobby controls:
- Set **Automatically admit people** to **People in my organization** or **Organizer only**
- Enable **Always let callers bypass the lobby** to **Off**

**Learn more:**

- [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
- [Control who can bypass the meeting lobby](https://learn.microsoft.com/microsoftteams/who-can-bypass-meeting-lobby)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)

<!--- Results --->

%TestResult%
