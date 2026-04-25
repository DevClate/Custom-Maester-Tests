---
title: TEAMS.TC.5045 - Message translation review for sensitive data
description: Review of message translation feature considering sensitive data exposure
---

# TEAMS.TC.5045 - Message Translation Review for Sensitive Data

## Description

This informational/security test reviews the status of the message translation feature in Microsoft Teams.

Message translation allows users to automatically translate messages to their preferred language, improving communication in multilingual teams. However, translation requires sending message content to external translation services, which presents security and privacy considerations.

## Why This Matters

- **Data Privacy:** Messages sent to external translation services
- **Sensitive Information:** Confidential data may be exposed
- **Compliance:** Regulations may prohibit external data processing
- **Security:** Third-party services access message content
- **Control:** Loss of data custody during translation
- **Audit:** Translation events may not be fully logged
- **Multilingual Support:** Balancing accessibility with security

## Security and Privacy Considerations

### Privacy Risks with Translation:
- **External Processing:** Microsoft Translator service processes message content
- **Data Exposure:** Sensitive information leaves organizational control
- **Third-Party Access:** External service has temporary access to content
- **Compliance:** May violate data residency or processing requirements
- **Confidential Data:** Trade secrets, PII, or confidential info exposed
- **Audit Trail:** Translation activity tracking may be limited

### Data Types at Risk:
- Personally Identifiable Information (PII)
- Protected Health Information (PHI)
- Financial data
- Trade secrets and proprietary information
- Attorney-client privileged communications
- Confidential business discussions
- Customer information

## Compliance Considerations

### Regulations That May Be Affected:
- **GDPR:** Data processing by third parties
- **HIPAA:** Protected health information handling
- **CCPA:** Consumer data processing restrictions
- **Financial Services:** Confidential client information
- **Legal:** Attorney-client privilege
- **Government:** Classified or sensitive information
- **Industry Standards:** Sector-specific data handling requirements

## Current Status Review

This test provides an informational review of whether message translation is currently enabled or disabled. Organizations should evaluate this setting based on their data sensitivity, compliance requirements, and multilingual needs.

**Consider enabling if:**
- Multilingual collaboration essential
- Data sensitivity is low
- Compliance allows external processing
- User productivity benefit outweighs risks
- Translation of non-confidential content acceptable
- DLP policies can prevent sensitive content translation

**Consider disabling if:**
- Highly sensitive or regulated data
- Compliance prohibits external processing
- Data must remain under strict control
- Industry regulations require data sovereignty
- Organization handles confidential information routinely
- Risk tolerance is low

## Alternative Solutions

If translation disabled due to security:
- Use dedicated multilingual staff for translation
- Implement approved internal translation services
- Utilize dedicated translation teams
- Provide language training programs
- Hire multilingual employees
- Use human translators for sensitive content
- Implement private machine translation solutions

## Configuration Steps

1. Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
2. Select the appropriate policy
3. Under **Translation** section, find **Users can translate messages**
4. Toggle **On** or **Off** based on your security and compliance requirements
5. Click **Save**

## Best Practices

### If Enabled:
- **Train users** on what content should NOT be translated
- **Implement DLP policies** to prevent sensitive data translation
- **Monitor translation usage** for inappropriate content
- **Document risk acceptance** by leadership
- **Classify data** and restrict translation for sensitive classifications
- **Audit regularly** to ensure appropriate use

### If Disabled:
- **Communicate policy** to users explaining reasons
- **Provide alternatives** for legitimate multilingual needs
- **Support multilingual staff** through other means
- **Review periodically** as security controls improve
- **Consider selective enablement** for low-sensitivity teams

## Risk Mitigation Strategies

If enabling translation despite risks:
1. **Data Loss Prevention (DLP):** Block translation of messages containing sensitive patterns
2. **Sensitivity Labels:** Prevent translation of labeled content
3. **User Training:** Educate on appropriate translation use
4. **Monitoring:** Log and review translation activities
5. **Conditional Access:** Restrict translation to specific user groups
6. **Policy Exemptions:** Disable for high-security teams/projects

## Learn More

- [Manage messaging policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Microsoft Translator in Teams](https://support.microsoft.com/en-us/office/translate-a-message-in-teams-d8926ce9-d6a6-47df-a416-f1adb62d3194)
- [Data Loss Prevention in Teams](https://learn.microsoft.com/en-us/microsoft-365/compliance/dlp-microsoft-teams)
- [Privacy in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/teams-privacy)
- [Microsoft Translator privacy](https://www.microsoft.com/en-us/translator/business/notrace/)
- [Compliance in Teams](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
