---
title: TEAMS.TC.5034 - Meet Now should be disabled for anonymous users
description: Ensures anonymous users cannot start ad-hoc meetings
---

# TEAMS.TC.5034 - Meet Now Should Be Disabled for Anonymous Users

## Description

This test checks if the "Meet Now" feature is disabled in anonymous meeting join policies.

## Policy Statement

Contoso's company policy requires Meet Now to be disabled as it allows users to start unscheduled meetings that may bypass meeting controls and security policies. This is important for maintaining governance over Teams meetings.

## Why This Matters

Meet Now allows users to instantly start ad-hoc meetings. When enabled for anonymous users, it creates security risks by allowing unauthorized individuals to create meeting spaces:

- **Unauthorized Access:** Anonymous users shouldn't create meeting spaces
- **Security Control:** Prevents uncontrolled meeting creation
- **Resource Abuse:** Stops anonymous users from consuming meeting resources
- **Audit Trail:** Ensures all meetings are traceable to authenticated users
- **Compliance:** Maintains accountability for meeting creation
- **Guest Management:** Enforces proper guest meeting controls

## Security Risks

When Meet Now is enabled for anonymous users:
- Unauthenticated individuals can create meetings
- No accountability for meeting creation
- Potential for abuse or spam meetings
- Difficult to track unauthorized meeting usage
- Resource consumption by non-organizational users
- Compliance and audit challenges

## Remediation Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the policy used for anonymous users
3. Under **General** section, find **Allow Meet Now**
4. Set this to **Off**
5. Click **Save**

## Learn More

- [Manage meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-in-teams)
- [Anonymous users and guests](https://learn.microsoft.com/en-us/microsoftteams/anonymous-users-in-meetings)
- [Teams security best practices](https://learn.microsoft.com/en-us/microsoftteams/teams-security-guide)
