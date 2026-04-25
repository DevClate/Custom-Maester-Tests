---
title: TEAMS.TC.5042 - Scoped people search review
description: Review of directory search scope restrictions in Teams
---

# TEAMS.TC.5042 - Scoped People Search Review

## Description

This informational test reviews the status of scoped people search and access in Microsoft Teams.

When enabled, this setting restricts the people search directory to specific groups or organizational units, limiting which users can be discovered and contacted within Teams.

## Why This Matters

- **Privacy:** Controls user discoverability
- **Security:** Limits organizational visibility
- **Segmentation:** Enables organizational boundaries
- **Compliance:** Supports privacy requirements
- **Access Control:** Restricts communication paths
- **Data Protection:** Limits exposure of user information

## Privacy and Security Considerations

### Benefits of Scoped Search:
- Users only see relevant organizational segments
- Reduces information leakage
- Supports multi-tenant or complex organizations
- Protects sensitive user groups
- Enables role-based visibility
- Supports privacy regulations

### Considerations for Full Directory:
- Improves cross-team collaboration
- Reduces friction in finding colleagues
- Supports organizational transparency
- Simplifies communication
- Reduces helpdesk inquiries about finding users
- Enables organic collaboration

## Current Status Review

This test provides an informational review of whether scoped people search is currently enabled or disabled. Organizations should evaluate this setting based on their structure, privacy requirements, and collaboration needs.

**Consider enabling if:**
- Organization has multiple business units requiring separation
- Privacy regulations mandate restricted visibility
- Sensitive user groups need protection
- Cross-departmental communication should be limited
- Complex organizational structure requires segmentation

**Consider disabling if:**
- Open collaboration valued
- Full directory access needed
- Organizational transparency important
- Friction in finding users problematic
- Simple organizational structure

## Implementation Considerations

### Technical Setup:
- Requires address book policies
- Exchange Online configuration needed
- Directory segmentation defined
- User assignments configured
- Testing required for smooth rollout

### User Impact:
- Users see limited directory results
- May need alternative methods to find certain colleagues
- Requires clear communication and training
- Help desk may receive inquiries
- Workarounds may be needed for cross-segment communication

## Configuration Steps

1. Navigate to [Teams Admin Center - Org-wide settings](https://admin.teams.microsoft.com/company-wide-settings/teams-settings)
2. Scroll to **Search by name** section
3. Review **Scope directory search using an Exchange address book policy**
4. Toggle based on your requirements
5. If enabling, ensure Exchange address book policies are configured
6. Click **Save**

**Note:** This setting requires corresponding Exchange Online address book policy configuration.

## Best Practices

If enabled:
- Clearly define organizational segments
- Document which users belong to which scopes
- Provide alternative contact methods for cross-segment communication
- Train users on limitations and workarounds
- Regularly review and update scoping rules

If disabled (full directory):
- Monitor for privacy concerns
- Implement other controls if needed
- Ensure users understand directory visibility
- Consider selective restrictions for sensitive accounts

## Learn More

- [Address book policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/teams-scoped-directory-search)
- [Exchange address book policies](https://learn.microsoft.com/en-us/exchange/address-books/address-book-policies/address-book-policies)
- [Privacy in Teams](https://learn.microsoft.com/en-us/microsoftteams/teams-privacy)
- [Information barriers in Teams](https://learn.microsoft.com/en-us/microsoftteams/information-barriers-in-teams)
