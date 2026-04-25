This test checks if channel meeting scheduling is appropriately configured for your organization.

Contoso's company policy requires channel meeting scheduling to be reviewed to ensure proper governance of Teams meetings. This is important for maintaining control over meeting creation, ensuring appropriate visibility, and managing collaboration workflows.

**To review this configuration:**

- Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings).
- Review the **AllowChannelMeetingScheduling** setting in the Global policy.
- Consider your organization's requirements:
  - **Collaboration**: Channel meetings make meetings visible to all channel members.
  - **Governance**: Unrestricted channel meeting creation may lead to sprawl.
  - **Visibility**: Channel meetings are more transparent than private meetings.
  - **Use Cases**: Some organizations prefer channel meetings, others prefer private meetings.
- Adjust the setting based on your organization's meeting governance policies.

**To control channel meeting scheduling:**

```powershell
# Disable channel meeting scheduling
Set-CsTeamsMeetingPolicy -Identity Global -AllowChannelMeetingScheduling $false

# Enable channel meeting scheduling
Set-CsTeamsMeetingPolicy -Identity Global -AllowChannelMeetingScheduling $true
```

**Learn more:**

- [Manage meeting policies in Teams](https://learn.microsoft.com/microsoftteams/meeting-policies-overview)
- [Channel meetings vs private meetings](https://learn.microsoft.com/microsoftteams/manage-meeting-policies)

<!--- Results --->

%TestResult%
