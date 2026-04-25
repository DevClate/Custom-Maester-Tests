This test checks if broadcast attendee visibility is configured to protect attendee privacy.

Contoso's company policy requires broadcast attendee visibility to be restricted to protect privacy. This is important because exposing attendee lists can reveal sensitive information about who is interested in particular topics, create privacy concerns, or enable unwanted contact between attendees.

**The test fails if:**

- **BroadcastAttendeeVisibilityMode** is set to `EveryoneInCompany` (allows all attendees to see each other).

**Recommended setting:**

The attendee visibility mode should be set to a more restrictive option to protect privacy:

- **InvitedUsersInCompany**: Only invited users from the organization can see the attendee list.
- **Everyone**: Organizers control visibility (more granular control).

**To remediate:**

**Note:** Broadcast policy settings are not accessible via the Teams Admin Center and must be configured using PowerShell.

Use PowerShell to change the **BroadcastAttendeeVisibilityMode** setting:

```powershell
# Set to InvitedUsersInCompany (recommended)
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -BroadcastAttendeeVisibilityMode InvitedUsersInCompany
```

**Privacy considerations:**

- **Attendee lists** can reveal organizational structure and relationships.
- **Sensitive topics** may require stricter privacy (e.g., HR, legal, financial topics).
- **External participants** may be uncomfortable with visibility.
- **Compliance** may require attendee anonymity in certain contexts.

**Learn more:**

- [Teams broadcast policies](https://learn.microsoft.com/microsoftteams/teams-live-events/set-up-for-teams-live-events)
- [Configure live events settings](https://learn.microsoft.com/microsoftteams/teams-live-events/configure-teams-live-events)

<!--- Results --->

%TestResult%
