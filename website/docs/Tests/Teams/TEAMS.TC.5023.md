---
title: TEAMS.TC.5023 - Federation should be restricted to specific allowed domains
description: Ensures Teams federation is restricted to trusted domains instead of open federation
---

# TEAMS.TC.5023 - Federated Domains

## Description

This test checks if Microsoft Teams federation is restricted to specific allowed domains rather than allowing open federation to any external Teams organization.

## Policy Statement

Contoso's company policy requires federation to be restricted to trusted partner domains to prevent unauthorized external access and reduce security risks. Open federation allows any external Teams organization to contact your users, which can lead to phishing, social engineering, and data leakage.

## Why This Matters

- **Security Control:** Open federation increases attack surface from unknown organizations
- **Phishing Prevention:** Restricting federation reduces risk of impersonation attacks
- **Data Governance:** Controls which external organizations can access your users
- **Compliance:** Many regulations require knowing and controlling external communication channels
- **Business Alignment:** Ensures only approved partner organizations can federate
- **Spam Prevention:** Reduces unsolicited external communication

## Test Results

The test provides three possible outcomes:

1. **Federation Disabled:** AllowFederatedUsers is False (informational)
2. **Open Federation:** Enabled with no domain restrictions (fails)
3. **Restricted Federation:** Enabled with specific allowed domains (passes)

## Remediation Steps

1. Navigate to [Teams Admin Center - External Access](https://admin.teams.microsoft.com/company-wide-settings/external-communications)
2. Under **Teams and Skype for Business users in external organizations**
3. Select **Allow only specific external domains**
4. Add your trusted partner domains to the allowed list
5. Remove any domains from the blocked list if using allow list
6. Click **Save**

## Best Practices

- Maintain a documented list of approved partner domains
- Regularly review the allowed domain list
- Remove domains when partnerships end
- Use specific domains rather than wildcards when possible
- Communicate federation policy to end users

## Learn More

- [Manage external access in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)
- [External access vs guest access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations)
- [Federation in Teams](https://learn.microsoft.com/en-us/microsoftteams/federation-overview)
