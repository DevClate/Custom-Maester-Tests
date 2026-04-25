---
title: TEAMS.TC.5033 - Meeting recording security review
description: Reviews security settings for meeting recordings including storage location and transcription
---

# TEAMS.TC.5033 - Meeting Recording Security Review

## Description

This security review test checks multiple meeting recording settings: cloud recording storage location (regional compliance), cloud recording enablement status, and meeting transcription settings.

## Policy Statement

This comprehensive security review examines cloud recording, transcription, and storage location settings for Teams meetings. Organizations should review these settings to ensure they align with security and compliance requirements.

## Why This Matters

These settings impact data residency, compliance, and information security.

## Why This Matters

- **Data Residency:** Recording storage location affects compliance
- **Compliance:** Industry regulations may restrict where recordings are stored
- **Privacy:** Transcriptions contain sensitive conversation data
- **Security:** Recordings may capture confidential information
- **Legal:** Regional laws govern recording storage and access
- **Discovery:** Recordings create discoverable content for legal holds

## Security Considerations

### Recording Storage Location
- **Outside Region:** May violate data residency requirements
- **Compliance Risk:** GDPR, HIPAA, or other regulations may require regional storage
- **Audit Trail:** Need to track where sensitive data is stored

### Cloud Recording
- **Enabled:** Users can create recorded artifacts of meetings
- **Storage:** Recordings stored in OneDrive/SharePoint
- **Access Control:** Recordings inherit sharing permissions
- **Retention:** Subject to retention policies

### Transcription
- **Sensitive Content:** Transcriptions capture all spoken content
- **Search:** Transcribed content is searchable
- **Discovery:** Creates additional discoverable artifacts
- **Privacy:** May capture non-public information

## Current Status Review

This test provides an informational review of your current recording security settings. Organizations should evaluate these settings against their:
- Data residency requirements
- Compliance obligations
- Privacy policies
- Security standards
- Legal requirements

## Remediation Steps

### To Configure Recording Storage:
1. Navigate to [Teams Admin Center - Meeting Policies](https://admin.teams.microsoft.com/policies/meetings)
2. Select the appropriate policy
3. Under **Recording & transcription** section
4. Review **Cloud recording** setting
5. Review **Allow recording storage outside your region** setting
6. Review **Transcription** settings
7. Click **Save**

### Security Recommendations:
- **Disable outside-region storage** if compliance requires regional data residency
- **Enable recording only if needed** for business requirements
- **Implement retention policies** for recorded content
- **Train users** on recording policies and consent requirements
- **Review access controls** on recording storage locations

## Learn More

- [Teams cloud meeting recording](https://learn.microsoft.com/en-us/microsoftteams/cloud-recording)
- [Meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-recording-and-transcription)
- [Data residency in Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/enterprise/o365-data-locations)
- [Compliance in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/security-compliance-overview)
