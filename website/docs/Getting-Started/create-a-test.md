---
sidebar_position: 1
---
# Create a Test

### Step 1: Create the tests file in the `Custom` folder

Create a new file in the `Custom` folder with the `.Tests.ps1` suffix.

#### Test-ContosoUsersMissingManagers.Tests.ps1

```powershell
BeforeAll {
.$PSScriptRoot/Test-ContosoUsersMissingManagers.ps1
}
Describe "Contoso" -Tag "ENTRA.UA.1001", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1001: Manager Attribute - All users should have a manager attribute set" {
	$result = Test-ContosoUsersMissingManagers
	$result| Should -Be $true-Because "All users should have a manager assigned."
    }
}
```

### Step 2: Create test functions file

Create the test file in the `Custom` folder that was referred to in the `BeforeAll` block in the previous step.

#### Test-ContosoUsersMissingManagers.ps1

```powershell
function Test-ContosoUsersMissingManagers {
	$result = $true

	try {
	   # Retrieve all users from Microsoft Graph
	   $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'"

	   # Initialize an array to track users without a manager
	   $usersWithoutManager = @()

	   # Loop through each user and ensure they have a manager assigned
	   foreach ($user in $users) {
		if ($user.jobTitle -eq "CEO" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account"){
		continue
}

		# Fetch the manager for the current user
		$manager = Get-MgUserManager -UserId $user.Id -ErrorAction SilentlyContinue

		if ([string]::IsNullOrEmpty($manager)) {
		   $result = $false
		   $usersWithoutManager += $user
		}
	   }

	   if ($result) {
		$TestResults = "Well done! There were no users with out managers assigned."
	   } else {
		$TestResults += "No managers are assigned for the following users.`n%TestResult%"
	   }

	   Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutManager -GraphObjectType Users
	} catch {
	   $result = $false
	   Write-Error $_.Exception.Message
	}

	return $result
}
```

### Step 3: Create the markdown file

Create a markdown file in the `Custom` folder **with the same name as the test file** but with the `.md` extension.

#### Test-ContosoUsersMissingManagers.md

```md
This test checks if there are any users without a manager assigned.

Contoso's company policy requires that all users have a manager assigned to them. This is important for accountability and delegation of responsibilities.

**To remediate this issue:**

- Identify the users without a manager.
- Raise a ticket in Service Now using [Form: Manager Missing - HR Ticket](https://contoso.service-now.com/managermissing) to request the manager assignment for the users identified in this test.
- 🔺 If this is not actioned in three days, escalate to the HR manager.

**Learn more:**

-[Manager Missing - HR Ticket](https://contoso.service-now.com/managermissing)
-[HR Escalation Process](https://contoso.service-now.com/hrescalation)

<!--- Results --->

%TestResult%

```

### Step 4: Run the test

Now when you run your custom tests folder this test should show

### Step 5: Customize to your company

For all 3 files, run the Find and replace for "Contoso" with your company name.
