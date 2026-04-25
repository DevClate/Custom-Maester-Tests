---
title: TEAMS.TC.5041 - Chat message deletion review
description: Review of owner permissions to delete messages in group chats
---

# TEAMS.TC.5041 - Chat Message Deletion Review

## Description

This informational test reviews the status of the setting that allows chat owners to delete messages from group chats.

## Policy Statement

This informational test examines the message deletion permissions for chat owners, which is important for chat governance and moderation capabilities.

## Why This Matters

This permission affects chat governance, moderation capabilities, and data retention.

## Why This Matters

- **Governance:** Controls message lifecycle management
- **Moderation:** Enables removal of inappropriate content
- **Compliance:** Affects data retention policies
- **Audit Trail:** Impacts message history integrity
- **Accountability:** Determines who can remove evidence
- **User Rights:** Balances control vs. user autonomy

## Governance Considerations

### Benefits of Allowing Deletion:
- Owners can moderate inappropriate content
- Enables removal of sensitive data posted accidentally
- Provides chat management capabilities
- Helps maintain professional standards
- Allows correction of mistakes
- Supports incident response

### Concerns with Allowing Deletion:
- Evidence can be destroyed
- Audit trail may be compromised
- Compliance investigations complicated
- Legal discovery affected
- Accountability reduced
- Potential abuse of power

## Current Status Review

This test provides an informational review of whether chat owners can delete messages. Organizations should evaluate this setting based on their governance requirements and compliance obligations.

**Consider enabling if:**
- Active moderation needed
- Inappropriate content removal important
- Quick response to incidents required
- User mistake correction valued
- Chat hygiene important

**Consider disabling if:**
- Complete audit trail required
- Legal discovery needs paramount
- Compliance mandates message preservation
- Accountability for all messages needed
- Organization prefers retention over deletion

## Configuration Steps

1. Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
2. Select the appropriate policy
3. Under **Message management** section, find **Owners can delete sent messages**
4. Toggle **On** or **Off** based on your governance requirements
5. Click **Save**

## Best Practices

If enabled:
- Train owners on appropriate use
- Document deletion policy
- Implement logging of deletions
- Define what constitutes appropriate deletion
- Balance moderation with preservation
- Consider legal hold implications

If disabled:
- Ensure alternative moderation methods exist
- Communicate immutable message policy
- Implement reporting mechanisms for inappropriate content
- Train users on responsible messaging
- Consider legal hold and discovery benefits

## Related Considerations

- **Retention Policies:** May conflict with deletion permissions
- **Legal Holds:** Take precedence over deletion permissions
- **Compliance Recording:** May capture deleted messages
- **Audit Logs:** Track deletion events
- **User Deletion:** Users can always delete their own messages

## Learn More

- [Manage messaging policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Data retention in Teams](https://learn.microsoft.com/en-us/microsoftteams/retention-policies)
- [Compliance in Teams](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
- [Teams governance planning](https://learn.microsoft.com/en-us/microsoftteams/plan-teams-governance)
