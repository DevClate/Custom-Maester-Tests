---
title: TEAMS.TC.5008 - Anonymous users should not dial out
description: Ensures anonymous users are restricted from dialing out to prevent toll fraud
---
## Anonymous users should not be allowed to dial out

## Description

Anonymous users should not be allowed to dial out from Microsoft Teams meetings to prevent toll fraud and unauthorized PSTN (Public Switched Telephone Network) usage. Allowing anonymous dial-out creates potential for abuse and unexpected communication charges.

**Security and Financial Risks:**

When anonymous dial-out is enabled:
- Potential for toll fraud and unauthorized charges
- Risk of PSTN resource abuse
- Difficulty tracking call accountability
- Unexpected communication costs
- Potential for international calling abuse

:::warning Financial Risk
Anonymous dial-out can lead to toll fraud where unauthorized users make expensive phone calls at your organization's expense, potentially resulting in thousands of dollars in fraudulent charges.
:::

:::info Availability
This setting may not be available in all licensing tiers or tenant configurations. The test will be skipped if the property is not available in your tenant.
:::

## How to fix

### Disable Anonymous Dial Out in Teams Admin Center

1. Navigate to the [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Participants & guests**, locate **Let anonymous people dial out to phone numbers**
4. Set this option to **Off**
5. Click **Save**

### Verify via PowerShell

```powershell
# Connect to Teams
Connect-MicrosoftTeams

# Check if the property exists and current setting
$policy = Get-CsTeamsMeetingPolicy -Identity Global
if ($policy.PSObject.Properties['AllowAnonymousUsersToDialOut']) {
    $policy | Select-Object AllowAnonymousUsersToDialOut
} else {
    Write-Host "AllowAnonymousUsersToDialOut property not available in this tenant"
}

# Disable anonymous dial out (if property exists)
Set-CsTeamsMeetingPolicy -Identity Global -AllowAnonymousUsersToDialOut $false

# Verify the change
Get-CsTeamsMeetingPolicy -Identity Global | Select-Object AllowAnonymousUsersToDialOut
```

## Impact

Disabling anonymous dial out will:
- ✅ Prevent toll fraud from anonymous users
- ✅ Reduce unauthorized PSTN charges
- ✅ Improve accountability for dial-out usage
- ⚠️ Anonymous users cannot dial phone numbers from meetings

:::info
Only authenticated users will be able to dial out to phone numbers from Teams meetings, ensuring accountability and reducing fraud risk.
:::

## Related tests

- [TEAMS.TC.5006 - Anonymous Join Meeting](./TEAMS.TC.5006.md)
- [TEAMS.TC.5007 - Anonymous Start Meeting](./TEAMS.TC.5007.md)

## Related links

* [Teams admin center - Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
* [Manage meeting policies - Anonymous participants](https://learn.microsoft.com/microsoftteams/meeting-policies-participants-and-guests#anonymous-participants)
* [Plan for Teams Phone](https://learn.microsoft.com/microsoftteams/what-is-phone-system-in-office-365)
* [Teams security best practices](https://learn.microsoft.com/microsoftteams/teams-security-guide)
* [Set-CsTeamsMeetingPolicy](https://learn.microsoft.com/powershell/module/teams/set-csteamsmeetingpolicy)
