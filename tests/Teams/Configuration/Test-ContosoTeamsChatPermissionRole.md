This test checks if chat permission roles are appropriately configured for your organization.

Contoso's company policy requires chat permission roles to be reviewed to ensure they align with collaboration and security requirements. This is important for maintaining proper control over group chat management while enabling effective collaboration.

**To review this configuration:**

- Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging).
- Review the **ChatPermissionRole** setting in the Global policy.
- Consider your organization's requirements:
  - **Full**: Users can add and remove any participant from group chats.
  - **Limited**: Users cannot remove participants they didn't add themselves.
  - **Restricted**: Users have minimal chat management permissions.
- Balance between:
  - **Collaboration**: More permissions enable flexible team communication.
  - **Control**: Restricted permissions prevent unauthorized chat modifications.
  - **Security**: Limiting permissions can prevent information disclosure.

**To configure chat permission roles:**

```powershell
# Set to Full (maximum flexibility)
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Full

# Set to Limited (balanced approach)
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Limited

# Set to Restricted (maximum control)
Set-CsTeamsMessagingPolicy -Identity Global -ChatPermissionRole Restricted
```

**Use cases:**

- **Full**: Appropriate for organizations with high trust and collaboration needs.
- **Limited**: Recommended for most organizations - balances flexibility and control.
- **Restricted**: Best for highly regulated environments or organizations with strict communication policies.

**Learn more:**

- [Manage messaging policies in Teams](https://learn.microsoft.com/microsoftteams/messaging-policies-in-teams)
- [Chat permissions and roles](https://learn.microsoft.com/microsoftteams/manage-messaging-policies)

<!--- Results --->

%TestResult%
