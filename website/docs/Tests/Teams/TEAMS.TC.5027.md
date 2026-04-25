---
title: TEAMS.TC.5027 - Guests should not be able to start ad-hoc meetings
description: Ensures guests cannot use Meet Now to prevent unauthorized meetings
---

# TEAMS.TC.5027 - Guest Meet Now

## Description

This test checks if the Meet Now feature is disabled for guest users in Microsoft Teams.

## Policy Statement

Contoso's company policy requires that guests cannot start ad-hoc meetings using the Meet Now feature. Allowing guests to create meetings could lead to unauthorized meetings, loss of meeting governance, and potential security risks. Internal users should maintain control over meeting creation.

## Why This Matters

- **Meeting Governance:** Organizations should control who can create meetings
- **Security:** Prevents guests from creating unsupervised meeting spaces
- **Resource Management:** Controls meeting resource allocation
- **Compliance:** Meeting creation should be tracked and controlled
- **Policy Enforcement:** Ensures meeting policies are properly applied
- **Authorization:** Guests are participants, not meeting organizers

## Risks of Allowing Guest Meet Now

- **Unauthorized Meetings:** Guests could create meetings without internal oversight
- **Policy Bypass:** Guest-created meetings may not follow organizational policies
- **Meeting Sprawl:** Uncontrolled meeting creation
- **Audit Challenges:** Harder to track who initiated meetings
- **Security Incidents:** Guests could invite unauthorized participants
- **Compliance Issues:** Guest meetings may not follow retention policies

## Remediation Steps

1. Navigate to [Teams Admin Center - Guest Configuration](https://admin.teams.microsoft.com/company-wide-settings/guest-configuration)
2. Under **Meetings** section, find **Allow Meet Now**
3. Set this to **Off**
4. Click **Save**

## Best Practice

Internal users should:
- Create and schedule meetings for guest participation
- Control meeting settings and policies
- Manage meeting participants and permissions
- Own meeting recordings and content

Guests should:
- Participate in meetings created by internal users
- Not have ability to create their own meetings
- Follow organizational meeting policies
- Respect meeting governance

## Learn More

- [Manage guest access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/guest-access)
- [Guest meeting settings](https://learn.microsoft.com/en-us/microsoftteams/guest-access#manage-guest-access)
- [Teams meeting policies](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-overview)
- [Teams security best practices](https://learn.microsoft.com/en-us/microsoftteams/teams-security-guide)
