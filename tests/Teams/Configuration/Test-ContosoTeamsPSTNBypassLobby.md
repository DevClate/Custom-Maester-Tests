This test checks if PSTN users are required to go through the meeting lobby.

Contoso's company policy requires PSTN callers (phone dial-in users) to be authenticated through the meeting lobby. This is important for security as phone callers cannot be pre-authenticated and should be admitted by meeting organizers.

**To remediate this issue:**

- Navigate to the [Teams admin center > Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the Global (Org-wide default) policy
- Set **People dialing in can bypass the lobby** to **Off**
- Click **Save**

**Learn more:**

- [Manage meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-overview)
- [Control who can bypass the meeting lobby](https://learn.microsoft.com/en-us/microsoftteams/who-can-bypass-meeting-lobby)

<!--- Results --->

%TestResult%
