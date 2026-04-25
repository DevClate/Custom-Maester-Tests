---
sidebar_position: 4
---

# Using AI to Create Tests

The Custom Maester Tests repository includes AI-powered tools to help you quickly generate new tests that follow all repository conventions.

## The `/create-maester-test` Skill

This AI skill automates the creation of custom Maester tests, ensuring all three required files are generated with proper naming, structure, and conventions.

### When to Use

Use the `/create-maester-test` skill when you need to:

- Create a new custom Maester test
- Add tests for user attributes, formatting, or validation
- Ensure proper test structure with all 3 files
- Follow repository naming and coding conventions

### How to Use

1. **Open GitHub Copilot Chat** in VS Code (Ctrl+Cmd+I or View → Copilot Chat)

2. **Type the slash command** `/create-maester-test` followed by your test description:

   ```
   /create-maester-test Create a test to check if users have a valid employee ID
   ```

3. **Answer the questions** - The AI will ask you for:
   - Test category (Attributes, Formatting, or Validating)
   - Specific attributes to check
   - Success and failure messages
   - Remediation steps
   - Service Now links (if applicable)

4. **Review the generated files** - The skill will create all 3 files:
   - `Test-ContosoYourTest.ps1` - PowerShell function
   - `Test-ContosoYourTest.tests.ps1` - Pester test
   - `Test-ContosoYourTest.md` - Documentation

5. **Test your new test**:
   ```powershell
   Invoke-Pester -Path tests/Entra/{Category}/Test-ContosoYourTest.tests.ps1
   ```

## Test Categories

### Attributes Tests

For checking missing required user attributes.

**Test ID Format:** `ENTRA.UA.####`

**Example Request:**
```
/create-maester-test Create an attributes test to check if users are missing a business phone
```

**What Gets Generated:**
- Function that checks for null or empty attributes
- Exclusion for sync account
- Proper error collection
- Success/failure messages

### Formatting Tests

For validating attribute format compliance using regex patterns.

**Test ID Format:** `ENTRA.UF.####.T##.{Variant}`

**Example Request:**
```
/create-maester-test Create a formatting test for USA postal codes (12345 or 12345-6789 format)
```

**What Gets Generated:**
- Function with regex pattern validation
- Format examples in comments
- Invalid user collection
- Format-specific messages

**Common Regex Patterns:**
- USA Phone (Format 1): `^\(\d{3}\)\s\d{3}-\d{4}\sx\d+$` → (555) 123-4567 x890
- USA Phone (Format 2): `^\d{3}-\d{3}-\d{4}$` → 555-123-4567
- USA Postal: `^\d{5}(-\d{4})?$` → 12345 or 12345-6789
- Canada Postal: `^[A-Z]\d[A-Z]\s?\d[A-Z]\d$` → A1A 1A1

### Validating Tests

For checking attributes against allowed values defined in `validation.json`.

**Test ID Format:** `ENTRA.UV.####`

**Example Request:**
```
/create-maester-test Create a validating test to check if users have approved job titles
```

**What Gets Generated:**
- Function that loads validation.json
- Case-sensitive comparison against allowed values
- Proper null handling
- Invalid user tracking

**Remember:** After creating a Validating test, update `tests/Entra/Validating/validation.json` with the allowed values.

## Automatic Validation Hook

The repository includes a validation hook that automatically checks your test files as they're created.

### What the Hook Validates

- **3-File Pattern**: Reminds you to create all three files (.ps1, .tests.ps1, .md)
- **Naming Consistency**: Warns if filenames don't match

### Hook Behavior

When you create a test file, you'll see a notification:

```
⚠️ Maester Test Pattern: Creating Test-ContosoUsersMissingX.ps1. 
Remember to create all 3 files: Test-ContosoUsersMissingX.tests.ps1, Test-ContosoUsersMissingX.md
```

This is a **reminder**, not a blocker. You can continue creating files, but make sure to complete all three.

## Tips for Best Results

### 1. Be Specific in Your Request

**Good:**
```
/create-maester-test Create an attributes test to check if users are missing a manager, 
excluding CEOs
```

**Too Vague:**
```
/create-maester-test Create a test for managers
```

### 2. Include Test Category

Mention whether you want an Attributes, Formatting, or Validating test:

```
/create-maester-test Create a FORMATTING test for email addresses that must be lowercase
```

### 3. Specify Exclusions

If certain users should be excluded, mention it upfront:

```
/create-maester-test Create a test for missing business phones, but skip users with job title "Contractor"
```

### 4. Provide Regex Patterns for Formatting

If you have a specific format in mind, include it:

```
/create-maester-test Create a formatting test for phone numbers matching (555) 123-4567 x890 pattern
```

## After Creating Tests

### 1. Run the Test

Test your new test locally:

```powershell
# Run specific test
Invoke-Pester -Path tests/Entra/Attributes/Test-ContosoYourTest.tests.ps1

# Run all tests in category
Invoke-Pester -Path tests/Entra/Attributes/

# Run by tag
Invoke-Pester -Tag "ENTRA.UA.1001"
```

### 2. Update Validation.json (Validating Tests Only)

If you created a Validating test, add the allowed values to `tests/Entra/Validating/validation.json`:

```json
{
  "validTitles": [
    {"title": "CEO"},
    {"title": "Manager"},
    {"title": "Developer"}  // Add your new value
  ]
}
```

### 3. Add to Docusaurus

Create documentation for your test in `website/docs/Tests/{Category}/`:

```bash
cd website
npm run start  # Preview your docs locally
```

### 4. Customize Company Name

When ready to deploy, replace "Contoso" with your company name:

```bash
# Find and Replace "Contoso" with "YourCompany" in:
# - All 3 test files
# - Docusaurus documentation
```

## Examples

### Example 1: Missing Department Test

**Request:**
```
/create-maester-test Create an attributes test to check if users are missing a department
```

**Generated Files:**
- `tests/Entra/Attributes/Test-ContosoUsersMissingDepartment.ps1`
- `tests/Entra/Attributes/Test-ContosoUsersMissingDepartment.tests.ps1`
- `tests/Entra/Attributes/Test-ContosoUsersMissingDepartment.md`

### Example 2: Email Format Test

**Request:**
```
/create-maester-test Create a formatting test to ensure email addresses start with a lowercase letter
```

**Generated Files:**
- `tests/Entra/Formatting/Test-ContosoUsersFormattingLowerCaseInitialEmail.ps1`
- `tests/Entra/Formatting/Test-ContosoUsersFormattingLowerCaseInitialEmail.tests.ps1`
- `tests/Entra/Formatting/Test-ContosoUsersFormattingLowerCaseInitialEmail.md`

### Example 3: Department Validation Test

**Request:**
```
/create-maester-test Create a validating test to check if users have departments from the approved list
```

**Generated Files:**
- `tests/Entra/Validating/Test-ContosoUsersAllowedDepartments.ps1`
- `tests/Entra/Validating/Test-ContosoUsersAllowedDepartments.tests.ps1`
- `tests/Entra/Validating/Test-ContosoUsersAllowedDepartments.md`

## Troubleshooting

### "Skill not found"

Make sure you're in the workspace directory. The skill is only available when working with the Custom Maester Tests repository.

### "Hook validation failed"

The hook is informational only. If you see warnings about missing files, just continue creating the remaining files.

### Test ID conflicts

If the AI assigns a test ID that already exists, it will automatically suggest the next available ID. Check existing tests in the category to verify.

### Validation.json not loading

For Validating tests, ensure `validation.json` exists at:
```
tests/Entra/Validating/validation.json
```

## Learn More

- [Create a Test Manually](./create-a-test.md)
- [Company Standards Configuration](./company-standards.md)
- [Repository Structure](../intro.md)
