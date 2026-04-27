---
title: ENTRA.LC.3001 - License SKUs should not exceed 95% utilization
description: Monitors Microsoft 365 license capacity to prevent business disruption from license exhaustion
---

# ENTRA.LC.3001 - License SKUs Should Not Exceed 95% Utilization

## Description

This test validates that no Microsoft 365 license SKU exceeds 95% utilization in your tenant. Reaching capacity on critical licenses can prevent new user provisioning, block existing users from accessing services during license reassignment, and cause unexpected business disruptions.

## Policy Statement

Contoso's company policy requires proactive monitoring of license capacity to ensure sufficient availability for business operations, seasonal growth, and emergency provisioning needs. The 95% threshold provides advance warning before reaching 100% capacity, allowing time for procurement and license activation.

## Why This Matters

Running out of licenses creates several critical business impacts:

- **User Provisioning Blocked:** Cannot assign licenses to new employees or contractors
- **Service Disruption:** Existing users may lose access during license reallocation
- **Business Continuity:** Emergency access requests cannot be fulfilled
- **Productivity Loss:** Users waiting for licenses cannot access Microsoft 365 services
- **Compliance Risk:** Unlicensed users may create shadow IT solutions

### License Types Monitored

The test monitors all active SKUs including:
- Microsoft 365 E3/E5 licenses
- Microsoft 365 Business Basic/Standard/Premium
- Exchange Online Plans
- Teams, SharePoint, and other service-specific licenses
- Add-on licenses (Phone System, Audio Conferencing, etc.)

## How to Fix

### Step 1: Review Utilization Details

Run the test to identify which license SKUs are over-utilized. The test results show:
- License SKU name and ID
- Current utilization percentage
- Consumed units vs. enabled units
- Available units remaining

### Step 2: Calculate License Requirements

Determine how many additional licenses you need:

```
Immediate needs = (Consumed units) - (Enabled units) + buffer
Recommended buffer = 5-10% of total licenses
```

Consider upcoming hires, projects, or seasonal needs in your calculation.

### Step 3: Purchase Additional Licenses

#### Option A: Microsoft 365 Admin Center

1. Navigate to [Microsoft 365 admin center - Purchase services](https://admin.microsoft.com/Adminportal/Home#/catalog)
2. Go to **Billing** > **Purchase services**
3. Search for the license type that's over-utilized
4. Click **Details** on the matching product
5. Click **Buy** and specify the number of additional licenses
6. Complete the purchase workflow

#### Option B: Add Licenses to Existing Subscription

1. Navigate to [Microsoft 365 admin center - Your products](https://admin.microsoft.com/Adminportal/Home#/subscriptions)
2. Go to **Billing** > **Your products**
3. Select the subscription that needs more licenses
4. Click **Buy licenses** or **Add licenses**
5. Enter the quantity of additional licenses
6. Review and complete the purchase

**Note:** License purchases may require approval from procurement or finance teams.

#### Option C: Contact Microsoft Partner

If your organization purchases through a Cloud Solution Provider (CSP) or Enterprise Agreement:
1. Contact your Microsoft partner or account manager
2. Request additional licenses for the over-utilized SKU
3. Provide the SKU part number from the test results
4. Specify the quantity needed

### Step 4: Monitor Utilization Trends

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
            'Utilization %' = $utilization
        }
    }
} | Where-Object {$_.'Utilization %' -gt 80} | 
    Sort-Object 'Utilization %' -Descending | 
    Format-Table
```

## Important Considerations

- **Purchase Timing:** License activation can take 24-48 hours after purchase
- **Auto-Renewal:** Enable auto-renewal to prevent unexpected license expiration
- **License Optimization:** Review assigned licenses to reclaim unused licenses before purchasing
- **Cost Management:** Balance license availability with cost efficiency
- **Compliance:** Ensure you maintain enough licenses for all active users

## Related Links

- [Assign licenses to users in Microsoft 365](https://learn.microsoft.com/microsoft-365/admin/manage/assign-licenses-to-users)
- [Buy or remove licenses for a Microsoft business subscription](https://learn.microsoft.com/microsoft-365/commerce/licenses/buy-licenses)
- [Understand subscriptions and licenses in Microsoft 365](https://learn.microsoft.com/microsoft-365/commerce/licenses/subscriptions-and-licenses)
- [View licenses and services with PowerShell](https://learn.microsoft.com/microsoft-365/enterprise/view-licenses-and-services-with-microsoft-365-powershell)
