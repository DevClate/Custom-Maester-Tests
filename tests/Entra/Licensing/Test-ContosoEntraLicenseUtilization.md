This test validates that no Microsoft 365 license SKU exceeds 95% utilization in your tenant.

Contoso's company policy requires monitoring of license capacity to prevent business disruption. This is important because reaching capacity on critical licenses can prevent new user provisioning, block existing users from accessing services during license reassignment, and cause unexpected business disruptions.

Proactive monitoring of license utilization ensures you have sufficient capacity for business operations, seasonal growth, and emergency provisioning needs. The 95% threshold provides advance warning before reaching 100% capacity, allowing time for procurement and license activation.

License types monitored include all active SKUs such as:

- Microsoft 365 E3/E5 licenses
- Microsoft 365 Business Basic/Standard/Premium
- Exchange Online Plans
- Teams, SharePoint, and other service-specific licenses
- Add-on licenses (Phone System, Audio Conferencing, etc.)

## Remediation action:

### Step 1: Review license utilization details

Run this test to identify which license SKUs are over-utilized. The test results will show:

- License SKU name and ID
- Current utilization percentage
- Consumed units vs. enabled units
- Available units remaining

### Step 2: Determine license requirement

Calculate how many additional licenses you need:

- **Immediate needs**: (Consumed units) - (Enabled units) + buffer
- **Recommended buffer**: 5-10% of total licenses for flexibility
- **Growth planning**: Consider upcoming hires, projects, or seasonal needs

### Step 3: Purchase additional licenses

#### Option A: Microsoft 365 Admin Center

1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com)
2. Go to **Billing** > **Purchase services**
3. Search for the license type that's over-utilized
4. Click **Details** on the matching product
5. Click **Buy** and specify the number of additional licenses
6. Complete the purchase workflow
   - 🔺 **Escalation**: License purchases may require approval from procurement or finance teams

#### Option B: Add licenses to existing subscription

1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com)
2. Go to **Billing** > **Your products**
3. Select the subscription that needs more licenses
4. Click **Buy licenses** or **Add licenses**
5. Enter the quantity of additional licenses
6. Review and complete the purchase

#### Option C: Contact Microsoft partner or reseller

If your organization purchases through a Cloud Solution Provider (CSP) or Enterprise Agreement:

1. Contact your Microsoft partner or account manager
2. Request additional licenses for the over-utilized SKU
3. Provide the SKU part number from the test results
4. Specify the quantity needed

### Step 4: Monitor utilization trends

Set up regular monitoring to track license usage over time:

```powershell
# Check current license utilization for all SKUs
Connect-MgGraph -Scopes "Organization.Read.All"

Get-MgSubscribedSku | ForEach-Object {
    $enabled = $_.PrepaidUnits.Enabled
    if ($enabled -gt 0) {
        $utilization = [math]::Round(($_.ConsumedUnits / $enabled) * 100, 2)
        [PSCustomObject]@{
            License = $_.SkuPartNumber
            Consumed = $_.ConsumedUnits
            Enabled = $enabled
            Available = $enabled - $_.ConsumedUnits
            UtilizationPercent = $utilization
        }
    }
} | Where-Object {$_.UtilizationPercent -gt 80} | Sort-Object UtilizationPercent -Descending | Format-Table
```

## Important considerations:

- **Purchase timing**: License activation can take 24-48 hours after purchase
- **Auto-renewal**: Enable auto-renewal to prevent unexpected license expiration
- **License optimization**: Review assigned licenses to reclaim unused licenses before purchasing
- **Cost management**: Balance license availability with cost efficiency
- **Compliance**: Ensure you maintain enough licenses for all active users to stay compliant

**Learn more:**

- [Assign licenses to users in Microsoft 365](https://learn.microsoft.com/microsoft-365/admin/manage/assign-licenses-to-users)
- [Buy or remove licenses for a Microsoft business subscription](https://learn.microsoft.com/microsoft-365/commerce/licenses/buy-licenses)
- [Understand subscriptions and licenses in Microsoft 365](https://learn.microsoft.com/microsoft-365/commerce/licenses/subscriptions-and-licenses)
- [View licenses and services with PowerShell](https://learn.microsoft.com/microsoft-365/enterprise/view-licenses-and-services-with-microsoft-365-powershell)

<!--- Results --->

%TestResult%
