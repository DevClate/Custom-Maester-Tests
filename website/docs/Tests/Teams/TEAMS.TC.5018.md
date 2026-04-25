---
title: TEAMS.TC.5018 - Chat Permission Roles
description: Checks if chat permission roles align with collaboration and security requirements
---

# TEAMS.TC.5018 - Chat Permission Roles

## Description

This test checks if chat permission roles are appropriately configured for your organization.

## Policy Statement

Contoso's company policy requires chat permission roles to be reviewed to ensure they align with collaboration and security requirements.

## Why This Matters

Chat permission roles control what users can do in group chats:
- Add new participants
- Remove participants
- Promote/demote chat members
- Manage chat settings

Different organizations have different needs for control vs. flexibility.

## Configuration Options

### Full Permissions (Maximum Flexibility)

**What users can do:**
- Add any user to the chat
- Remove any participant (including those added by others)
- Promote users to owners
- Full chat management

**Best for:**
- Organizations with high trust culture
- Small, collaborative teams
- Fast-moving environments
- Startups

**Risks:**
- Users can remove important stakeholders
- Potential for information disclosure (adding wrong people)
- Difficult to maintain governance

```powershell
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Full
```

### Limited Permissions (Balanced Approach) ⭐ Recommended

**What users can do:**
- Add new users to the chat
- Remove only users they personally added
- Cannot remove users added by others

**Best for:**
- Most organizations
- Balance between flexibility and control
- Prevents accidental removal of key participants
- Still allows organic collaboration

**Benefits:**
- Protects critical conversations
- Maintains accountability (you can only remove people you added)
- Reduces support tickets ("Why was I removed?")

```powershell
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Limited
```

### Restricted Permissions (Maximum Control)

**What users can do:**
- Minimal chat management capabilities
- Only chat owners have full control
- Very limited ability to modify chat membership

**Best for:**
- Highly regulated environments
- Healthcare (HIPAA compliance)
- Financial services
- Government agencies
- Organizations with strict communication policies

**Considerations:**
- May frustrate users
- Can slow collaboration
- May increase IT support requests

```powershell
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Restricted
```

## How to Fix

### Review Current Setting

```powershell
Get-CsTeamsMessagingPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object ChatPermissionRole
```

### Change Global Setting

Choose the appropriate level for your organization:

```powershell
# Recommended for most organizations
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Limited
```

### Create Role-Specific Policies

Different user groups may need different permissions:

```powershell
# Executives - Full control
New-CsTeamsMessagingPolicy -Identity "ExecutiveMessaging" -ChatPermissionRole Full
Grant-CsTeamsMessagingPolicy -Group "Executives" -PolicyName "ExecutiveMessaging"

# General users - Balanced approach
New-CsTeamsMessagingPolicy -Identity "StandardMessaging" -ChatPermissionRole Limited
Grant-CsTeamsMessagingPolicy -Group "AllUsers" -PolicyName "StandardMessaging"

# Interns - Restricted
New-CsTeamsMessagingPolicy -Identity "InternMessaging" -ChatPermissionRole Restricted
Grant-CsTeamsMessagingPolicy -Group "Interns" -PolicyName "InternMessaging"
```

## Decision Matrix

| Organization Type | Recommended Setting | Rationale |
|-------------------|---------------------|-----------|
| Startup | Full | Speed and flexibility paramount |
| SMB | Limited | Balance of control and collaboration |
| Enterprise | Limited | Standard for most enterprises |
| Financial Services | Restricted | Compliance and audit requirements |
| Healthcare | Restricted | HIPAA and privacy requirements |
| Government | Restricted | Security and classification needs |
| Education | Limited | Supervised collaboration |

## Common Scenarios

### Scenario 1: Executive Accidentally Removed
**Problem:** Important stakeholder removed from confidential discussion  
**Solution:** Use `Limited` - only original adder can remove  

### Scenario 2: Chat Sprawl
**Problem:** Chats grow uncontrollably with irrelevant participants  
**Solution:** Use `Limited` - requires accountability for who you add

### Scenario 3: Compliance Audit
**Problem:** Need to prove who added whom to sensitive chats  
**Solution:** Use `Limited` or `Restricted` - clear audit trail

### Scenario 4: Fast-Moving Project Team
**Problem:** Team needs flexibility to add resources quickly  
**Solution:** Use `Full` for project team, `Limited` globally

## Monitoring and Compliance

### Audit Chat Modifications

```powershell
# Review messaging policies across organization
Get-CsOnlineUser | Select-Object DisplayName, TeamMessagingPolicy

# Check who has custom policies
Get-CsOnlineUser | Where-Object { $_.TeamMessagingPolicy -ne $null } | 
    Select-Object DisplayName, TeamMessagingPolicy
```

### User Communication

When changing this setting, communicate to users:
- What's changing and why
- What they can still do
- Who to contact if they need exceptions
- Best practices for chat management

## Best Practices

1. **Start restrictive, then relax** - Easier to grant permissions than revoke
2. **Pilot before rollout** - Test with one team first
3. **Document exceptions** - Keep record of who has Full permissions and why
4. **Review quarterly** - Audit policies and adjust as needed
5. **Train users** - Help them understand chat roles and permissions

## Learn More

- [Manage messaging policies in Teams](https://learn.microsoft.com/microsoftteams/messaging-policies-in-teams)
- [Chat permissions and roles](https://learn.microsoft.com/microsoftteams/manage-messaging-policies)
- [Teams security best practices](https://learn.microsoft.com/microsoftteams/security-best-practices)
