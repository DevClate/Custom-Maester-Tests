This test provides guidance on configuring Data Loss Prevention (DLP) policies for Microsoft Teams.

Contoso's company policy requires DLP policies to be configured to protect sensitive information shared in Teams chats, channel messages, and file uploads. This is important for preventing accidental or intentional disclosure of confidential data, ensuring compliance with regulations, and protecting intellectual property.

**To configure DLP policies for Teams:**

- Navigate to [Microsoft Purview - Data Loss Prevention](https://compliance.microsoft.com/datalossprevention).
- Click **Policies** and create a new DLP policy or review existing ones.
- Ensure the policy includes **Teams chat and channel messages** as a location.
- Configure rules to detect sensitive information types (credit cards, SSN, etc.).
- Set up policy tips to educate users when they attempt to share sensitive data.
- Configure actions (block, notify, or audit) based on your requirements.
- Test the policy in **audit mode** before enforcing to prevent disruption.
- Monitor DLP alerts and reports regularly in the Microsoft Purview portal.

**Recommended DLP policies for Teams:**

1. **Block sharing of credit card numbers, SSNs, and other PII**
2. **Prevent external sharing of documents marked as confidential**
3. **Alert on sharing of intellectual property markers**
4. **Restrict guest access to sensitive information**

**Learn more:**

- [Data Loss Prevention in Microsoft Teams](https://learn.microsoft.com/purview/dlp-microsoft-teams)
- [Create and configure DLP policies](https://learn.microsoft.com/purview/create-test-tune-dlp-policy)
- [DLP policy tips](https://learn.microsoft.com/purview/use-notifications-and-policy-tips)

<!--- Results --->

%TestResult%
