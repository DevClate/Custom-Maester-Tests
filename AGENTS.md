# Custom Maester Tests - AI Agent Instructions

## Repository Purpose

This repository contains custom [Maester](https://www.maester.dev) tests for Microsoft 365 tenants. Tests are PowerShell/Pester-based and validate user attributes, formatting rules, and organizational standards against Microsoft Graph API data.

## Core Concepts

### Test Structure (3-File Pattern)

**Every test requires exactly 3 files with matching names:**

1. **`Test-ContosoXXXX.ps1`** - PowerShell function implementing test logic
2. **`Test-ContosoXXXX.tests.ps1`** - Pester test file that sources and runs the function
3. **`Test-ContosoXXXX.md`** - Documentation with test description, company policy, remediation steps

### Test Categories

Tests are organized in `tests/Entra/` by category:

- **Attributes/** - Tests for missing required user attributes (business phone, manager, department, etc.)
- **Formatting/** - Tests validating attribute format compliance (phone numbers, postal codes, email formats)
- **Validating/** - Tests checking attributes against allowed values defined in `validation.json`

## File Conventions

### Test Function (.ps1)

```powershell
function Test-ContosoUsers{Purpose} {
    param(
        [string] $ValidatingPath = ("$PSScriptRoot/validation.json")  # Only for Validating tests
    )
    $result = $true
    try {
        # Get users from Graph API
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName,{attributes}"
        $invalidUsers = @()

        foreach ($user in $users) {
            # ALWAYS skip sync account
            if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }
            
            # Test logic here
            if (# validation fails) {
                $result = $false
                $invalidUsers += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! {Success message}"
        } else {
            $TestResults = "{Failure message}:`n%TestResult%"
        }
        
        Add-MtTestResultDetail -Result $TestResults -GraphObjects $invalidUsers -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}
```

### Pester Test (.tests.ps1)

```powershell
BeforeAll {
    . $PSScriptRoot/Test-ContosoUsers{Purpose}.ps1
}

Describe "Contoso" -Tag "{TEST_ID}", "Entra", "CustomTests", "{Category}", "Users" {
    It "{TEST_ID}: {Description} - {Expectation}" {
        $result = Test-ContosoUsers{Purpose}
        $result | Should -Be $true -Because "{Reason}"
    }
}
```

### Test IDs

Format: `ENTRA.{Category}.{Number}[.{Variant}]`

- **UA** - User Attributes (e.g., `ENTRA.UA.1001`)
- **UF** - User Formatting (e.g., `ENTRA.UF.1002.T01.USA`)
- **UV** - User Validation (e.g., `ENTRA.UV.1003`)

### Markdown Documentation (.md)

```markdown
This test checks {what the test validates}.

Contoso's company policy requires {business requirement}. This is important for {reason}.

**To remediate this issue:**

- Identify the users {with the issue}.
- Raise a ticket in Service Now using [Form: {Title}](https://contoso.service-now.com/{path}) to request {action}.
  - 🔺 If this is not actioned in three days, escalate to {role}.

**Learn more:**

- [{Link Title}](https://contoso.service-now.com/{path})

<!--- Results --->

%TestResult%
```

## Validation Configuration

`tests/Entra/Validating/validation.json` contains allowed values for validation tests:

```json
{
  "validTitles": [{"title": "CEO"}, ...],
  "validDepartments": [{"department": "IT"}, ...],
  "validLocations": [{
    "streetAddress": "...",
    "city": "...",
    "state": "...",
    "zipCode": "...",
    "country": "...",
    "businessPhones": "...",
    "companyName": "..."
  }, ...]
}
```

Validating tests load this file to check user attributes against allowed values.

## Creating New Tests

### Step 1: Determine Test ID and Category

- Attributes test: Check for missing required fields
- Formatting test: Validate field formats with regex patterns
- Validating test: Check against allowed values from validation.json

Assign next available test ID in the category (check existing tests).

### Step 2: Create All 3 Files

Use the templates above. Ensure:
- Function name matches file names
- Test ID is consistent across all files
- Appropriate tags are included in Pester test
- Markdown includes company policy and remediation steps

### Step 3: Common Patterns

**Always skip sync account:**
```powershell
if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
    continue
}
```

**Common exclusions:**
```powershell
if ($user.jobTitle -eq "CEO") {
    continue  // CEOs don't need managers
}
```

**Regex patterns for formatting:**
- USA Phone (Format 1): `^\(\d{3}\)\s\d{3}-\d{4}\sx\d+$` → (555) 123-4567 x890
- USA Phone (Format 2): `^\d{3}-\d{3}-\d{4}$` → 555-123-4567
- USA Postal: `^\d{5}(-\d{4})?$` → 12345 or 12345-6789
- Canada Postal: `^[A-Z]\d[A-Z]\s?\d[A-Z]\d$` → A1A 1A1

### Step 4: Update Documentation

After creating tests, update the Docusaurus website in `website/docs/Tests/{Category}/` with test documentation.

## Customization for Organizations

**The repository uses "Contoso" as placeholder company name.**

When organizations adopt these tests:
1. Find and Replace "Contoso" with their company name
2. Update validation.json with their allowed values
3. Customize remediation links in .md files (Service Now URLs, etc.)
4. Adjust exclusion logic (e.g., which roles don't need managers)

## Website Documentation

The `website/` folder contains a Docusaurus site:
- `website/docs/intro.md` - Introduction
- `website/docs/Getting-Started/` - Setup guides
- `website/docs/Tests/` - Test documentation by category
- `website/blog/` - Blog posts about new tests and updates

Build command: `npm run build` (from website directory)

## Development Commands

**Run tests:**
```powershell
# All tests in a folder
Invoke-Pester -Path tests/Entra/Attributes/

# Specific test
Invoke-Pester -Path tests/Entra/Attributes/Test-ContosoUsersMissingManagers.tests.ps1

# By tag
Invoke-Pester -Tag "ENTRA.UA.1001"
```

**Test validation.json changes:**
Run Validating category tests after editing validation.json.

## Critical Rules

1. **Never create tests without all 3 files** (.ps1, .tests.ps1, .md)
2. **Always use consistent naming** across all 3 files
3. **Always skip sync account** in user loops
4. **Use Invoke-MtGraphRequest** for Graph API calls (not direct Microsoft.Graph cmdlets)
5. **Return boolean** from test functions
6. **Use Add-MtTestResultDetail** to format results with GraphObjects
7. **Include %TestResult% placeholder** in markdown
8. **Follow test ID conventions** strictly
9. **Update validation.json** when creating new Validating tests
10. **Keep "Contoso"** as placeholder - users will customize later

## Graph API Patterns

**Common Graph requests:**
```powershell
# Get all member users
$users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName,attribute1,attribute2"

# Get user manager
$manager = Get-MgUserManager -UserId $user.Id -ErrorAction SilentlyContinue
```

**Select only needed attributes** to improve performance.

## Links

- **Maester Documentation**: https://www.maester.dev
- **Website**: https://devclate.github.io/Custom-Maester-Tests/
- **Creating Tests Guide**: [website/docs/Getting-Started/create-a-test.md](website/docs/Getting-Started/create-a-test.md)
