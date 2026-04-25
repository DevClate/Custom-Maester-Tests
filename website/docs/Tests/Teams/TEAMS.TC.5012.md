---
title: TEAMS.TC.5012 - Call Forwarding to Phone
description: Checks if call forwarding to PSTN is configured appropriately to prevent toll fraud
---

# TEAMS.TC.5012 - Call Forwarding to Phone

## Description

This test checks if call forwarding to external phone numbers (PSTN) is appropriately configured.

## Policy Statement

Contoso's company policy requires call forwarding to PSTN to be carefully reviewed due to toll fraud risks.

## Why This Matters

Call forwarding to PSTN can enable **toll fraud**, where attackers:
- Compromise user accounts
- Forward calls to premium-rate numbers
- Generate significant charges (potentially thousands of dollars)
- Exploit your organization's calling plan

This is one of the most common and expensive security risks in Teams calling.

## How to Fix

### Disable Call Forwarding to PSTN (Recommended)

For most organizations, disabling this feature for all users except specific roles is the best approach:

```powershell
Set-CsTeamsCallingPolicy -Identity Global -AllowCallForwardingToPhone $false
```

### Create Exception Policies

If some users legitimately need this feature:

1. Keep Global policy restrictive (disabled)
2. Create a custom policy for executive users:

```powershell
New-CsTeamsCallingPolicy -Identity "ExecutivesCalling" -AllowCallForwardingToPhone $true
Grant-CsTeamsCallingPolicy -Identity "user@contoso.com" -PolicyName "ExecutivesCalling"
```

### Implement Monitoring

If you must enable this feature:
- Set up alerts for unusual calling patterns
- Monitor call detail records regularly
- Implement spending caps with your carrier
- Review bills frequently for anomalies

### Check Current Setting

```powershell
Get-CsTeamsCallingPolicy | Where-Object { $_.Identity -eq "Global" } | Select-Object Identity, AllowCallForwardingToPhone
```

## Learn More

- [Manage calling policies in Teams](https://learn.microsoft.com/microsoftteams/teams-calling-policy)
- [Prevent toll fraud](https://learn.microsoft.com/microsoftteams/toll-fraud-overview)
- [Security best practices for Teams calling](https://learn.microsoft.com/microsoftteams/security-best-practices)
