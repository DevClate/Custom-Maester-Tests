---
title: TEAMS.TC.5039 - PSTN users should not bypass lobby
description: Ensures PSTN callers must wait in lobby for admission
---

# TEAMS.TC.5039 - PSTN Users Should Not Bypass Lobby

## Description

This test checks if PSTN (phone) users are required to wait in the meeting lobby before being admitted.

## Policy Statement

Contoso's company policy requires PSTN callers (phone dial-in users) to be authenticated through the meeting lobby. This is important for security as phone callers cannot be pre-authenticated and should be admitted by meeting organizers.

## Why This Matters

PSTN users dial into meetings via telephone. Allowing them to bypass the lobby creates security risks since phone callers are harder to verify than authenticated users.

## Why This Matters

- **Access Control:** Phone callers need authentication
- **Security:** Prevents unauthorized dial-in access
- **Verification:** Host can verify caller identity before admission
- **Meeting Protection:** Stops unknown parties from joining automatically
- **Compliance:** Maintains meeting security standards
- **Privacy:** Protects confidential discussions from unauthorized listeners

## Security Risks

When PSTN users can bypass the lobby:
- Unknown callers join meetings automatically
- No identity verification required
- Difficult to prevent unauthorized access
- Conference call bombing possible
- Toll fraud risks increase
- No audit trail of who joined via phone
- Compliance violations may occur
- Confidential information exposed

## Common Attack Scenarios

- **Conference Bombing:** Attackers dial in to disrupt meetings
- **Eavesdropping:** Unauthorized parties listen to confidential calls
- **Toll Fraud:** Stolen credentials used for unauthorized calls
- **Social Engineering:** Attackers impersonate employees via phone
- **Data Theft:** Competitors access proprietary discussions

## Remediation Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Participants & guests** section, find **Allow PSTN callers to bypass the lobby**
4. Set this to **Off**
5. Click **Save**

## User Impact

After implementing this change:
- PSTN callers wait in lobby until admitted
- Meeting hosts see notification when phone user joins lobby
- Host must manually admit each phone caller
- Increases security but adds slight overhead
- Users should be trained to verify phone callers

## Best Practices

- Train meeting hosts on admitting phone users
- Implement caller verification procedures
- Use meeting PINs for added security
- Document approved PSTN access procedures
- Monitor for suspicious dial-in attempts
- Consider separate policies for internal vs. external meetings

## Learn More

- [Manage meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-participants-and-guests)
- [PSTN calling in Teams](https://learn.microsoft.com/en-us/microsoftteams/pstn-connectivity)
- [Teams security best practices](https://learn.microsoft.com/en-us/microsoftteams/teams-security-guide)
- [Meeting lobby controls](https://learn.microsoft.com/en-us/microsoftteams/who-can-bypass-meeting-lobby)
