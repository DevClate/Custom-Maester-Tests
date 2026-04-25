This test checks if anonymous users are restricted from dialing out from Microsoft Teams meetings.

Contoso's company policy requires that anonymous users should not be allowed to dial out from meetings to prevent toll fraud and unauthorized PSTN usage. Allowing anonymous dial-out creates potential for abuse and unexpected communication charges.

**To remediate this issue:**

- Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the **Global (Org-wide default)** policy
- Under **Participants & guests**, locate **Let anonymous people dial out to phone numbers**
- Set this option to **Off**
- Click **Save**
- 🔺 If this setting cannot be changed, escalate to the Teams administrator.

**Note:** This setting may not be available in all licensing tiers or tenant configurations.

**Learn more:**

- [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
- [Plan for Teams Phone](https://learn.microsoft.com/microsoftteams/what-is-phone-system-in-office-365)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)

<!--- Results --->

%TestResult%
