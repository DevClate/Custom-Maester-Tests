This test checks if transcription control is disabled for guest users in Microsoft Teams.

Contoso's company policy requires that guests cannot control meeting transcription to prevent unauthorized data capture and maintain control over sensitive meeting content. Transcriptions create searchable records of meeting conversations that could contain confidential information.

**To remediate this issue:**

- Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
- Under **Meetings** section, find **Allow transcription**
- Set this to **Off**
- Click **Save**

**Security Considerations:**
- Transcriptions create permanent, searchable records of meetings
- Guests may download or share transcription content
- Transcriptions may contain sensitive business information
- Only internal users should control transcription features

**Learn more:**

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Teams meeting transcription](https://learn.microsoft.com/en-us/microsoftteams/meeting-transcription-captions)
- [Guest meeting settings](https://learn.microsoft.com/en-us/microsoftteams/guest-access#manage-guest-access)

<!--- Results --->

%TestResult%
