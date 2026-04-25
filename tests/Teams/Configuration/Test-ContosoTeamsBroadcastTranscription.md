This test checks if broadcast transcription settings are appropriate for your organization.

Contoso's company policy requires broadcast transcription to be reviewed based on accessibility and compliance requirements. This is important for ensuring that live events meet organizational standards for accessibility while considering data storage, compliance, and privacy implications.

**To review this configuration:**

**Note:** Broadcast policy settings are not accessible via the Teams Admin Center and must be configured using PowerShell.

- Use PowerShell to review the **AllowBroadcastTranscription** setting in the Global policy:

```powershell
# Check current setting
Get-CsTeamsMeetingBroadcastPolicy -Identity Global | Select-Object AllowBroadcastTranscription

# Modify if needed (True or False)
Set-CsTeamsMeetingBroadcastPolicy -Identity Global -AllowBroadcastTranscription $true
```

- Consider your organization's requirements:
  - **Accessibility**: Transcription improves accessibility for attendees with hearing impairments.
  - **Compliance**: Some regulations may require or prohibit transcription.
  - **Privacy**: Transcriptions may contain sensitive information.
  - **Storage**: Transcriptions require additional storage space.
- Adjust the setting based on your organization's needs.

**Learn more:**

- [Configure Teams live events settings](https://learn.microsoft.com/microsoftteams/teams-live-events/configure-teams-live-events)
- [Teams broadcast policies](https://learn.microsoft.com/microsoftteams/teams-live-events/set-up-for-teams-live-events#step-3-set-up-a-teams-live-events-policy)

<!--- Results --->

%TestResult%
