This test checks if recording storage outside the tenant's region is disabled.

Contoso's company policy requires that meeting recordings stay within the tenant's home region for data residency and compliance purposes. This is important for organizations with regulatory requirements about data location.

**To remediate this issue:**

- Navigate to the [Teams admin center > Meeting policies](https://admin.teams.microsoft.com/policies/meetings)
- Select the Global (Org-wide default) policy
- Set **Recordings automatically expire** to **On** (optional)
- Set **Store recordings outside of your country or region** to **Off**
- Click **Save**

**Note:** This test is skipped if cloud recording is disabled, as the storage location is not applicable without cloud recording enabled.

**Learn more:**

- [Manage meeting policies in Teams](https://learn.microsoft.com/en-us/microsoftteams/meeting-policies-overview)
- [Teams cloud meeting recording](https://learn.microsoft.com/en-us/microsoftteams/cloud-recording)

<!--- Results --->

%TestResult%
