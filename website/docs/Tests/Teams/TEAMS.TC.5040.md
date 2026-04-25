---
title: TEAMS.TC.5040 - Recording storage should stay within region
description: Ensures meeting recordings are stored within the organization's geographic region for compliance
---

# TEAMS.TC.5040 - Recording Storage Should Stay Within Region

## Description

This test checks if meeting recording storage is restricted to the organization's geographic region.

## Policy Statement

Contoso's company policy requires that meeting recordings stay within the tenant's home region for data residency and compliance purposes. This is important for organizations with regulatory requirements about data location.

## Why This Matters

Data residency requirements often mandate that sensitive data, including meeting recordings, remain within specific geographic boundaries for compliance with local regulations:

- **Compliance:** GDPR, HIPAA, and other regulations mandate data residency
- **Legal Requirements:** Local laws may prohibit data export
- **Privacy:** Protects sensitive information across borders
- **Sovereignty:** Maintains data within national boundaries
- **Contractual:** Client contracts may require regional storage
- **Security:** Reduces exposure to foreign legal access
- **Audit:** Simplifies compliance verification

## Compliance Considerations

### Regulations Affected:
- **GDPR (Europe):** Strict data residency requirements
- **HIPAA (Healthcare):** Protected health information controls
- **CCPA (California):** Consumer privacy protections
- **PIPEDA (Canada):** Personal information protection
- **Industry Standards:** Financial services, government, healthcare

### Risks of Outside-Region Storage:
- Regulatory violations and fines
- Contract breaches with clients
- Legal discovery complications
- Foreign government access to data
- Compliance audit failures
- Reputation damage

## Conditional Requirements

**Note:** This setting is only relevant when cloud recording is enabled.

If your organization has disabled cloud recording (`AllowCloudRecording = FALSE`), then recording storage location is not applicable, and this test will be skipped.

## Remediation Steps

1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the **Global (Org-wide default)** policy
3. Under **Recording & transcription** section
4. Find **Allow recording storage outside your region**
5. Set this to **Off**
6. Click **Save**

## User Impact

When restricted to in-region storage:
- Recordings stored only in organization's geographic region
- Compliance requirements met automatically
- May impact cross-region collaboration slightly
- Users don't see functional differences
- Backend storage location changes only

## Additional Recommendations

- **Review Retention:** Implement appropriate retention policies
- **Access Controls:** Restrict recording access appropriately
- **Training:** Educate users on recording policies
- **Consent:** Ensure recording consent requirements met
- **Monitoring:** Audit recording creation and access
- **Documentation:** Maintain data residency documentation

## Learn More

- [Data residency in Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/enterprise/o365-data-locations)
- [Teams cloud recording](https://learn.microsoft.com/en-us/microsoftteams/cloud-recording)
- [Meeting policies for recording](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-recording-and-transcription)
- [GDPR and Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/teams-gdpr-compliance)
- [Compliance in Teams](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
