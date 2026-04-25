---
name: create-maester-test
description: 'Generate custom Maester tests with the 3-file pattern (PS1, tests.ps1, MD). Use when creating new test, add test, generate Maester test, scaffold test files, create Attributes test, create Formatting test, create Validating test.'
argument-hint: 'Describe the test purpose, category (Attributes/Formatting/Validating), and test ID'
---

# Create Maester Test

Automates the creation of custom Maester tests following the repository's 3-file pattern and conventions.

## When to Use

- Creating a new custom Maester test
- Adding tests for user attributes, formatting, or validation
- Scaffolding test files with proper naming and structure
- Ensuring all 3 required files are created correctly

## Test Categories

1. **Attributes** - Tests for missing required user attributes
   - Test ID format: `ENTRA.UA.####`
   - Example: Check for missing business phone, manager, department
   
2. **Formatting** - Tests validating attribute format compliance
   - Test ID format: `ENTRA.UF.####.T##.{Variant}`
   - Example: Phone number formats, postal codes, email patterns
   
3. **Validating** - Tests checking attributes against allowed values
   - Test ID format: `ENTRA.UV.####`
   - Example: Check department against validation.json

## Required Information

Before starting, gather:
- **Test Purpose**: What attribute/format/value to test
- **Category**: Attributes, Formatting, or Validating
- **Test ID**: Next available ID in the category
- **Company Policy**: Business requirement being enforced
- **Remediation Process**: How to fix failures

## Procedure

### 1. Determine Test ID

Check existing tests in the target category to find the next available test ID:
- Attributes: `tests/Entra/Attributes/`
- Formatting: `tests/Entra/Formatting/`
- Validating: `tests/Entra/Validating/`

### 2. Ask User for Details

Use [ask-questions tool](#) to gather:
- Test purpose and description
- Which user attributes to check
- Success/failure messages
- Remediation steps
- Service Now links (if applicable)

### 3. Create All 3 Files

Generate files using templates from [./references/](./references/):

**File 1: Test Function (.ps1)**
- Use [attributes-template.ps1](./references/attributes-template.ps1) for Attributes tests
- Use [formatting-template.ps1](./references/formatting-template.ps1) for Formatting tests
- Use [validating-template.ps1](./references/validating-template.ps1) for Validating tests

**File 2: Pester Test (.tests.ps1)**
- Use [pester-template.tests.ps1](./references/pester-template.tests.ps1)

**File 3: Documentation (.md)**
- Use [markdown-template.md](./references/markdown-template.md)

### 4. Critical Rules

Ensure all files follow these rules:
- **Consistent naming** across all 3 files
- **Always skip sync account** in user loops
- **Use Invoke-MtGraphRequest** for Graph API calls
- **Return boolean** from test function
- **Use Add-MtTestResultDetail** for formatting results
- **Include %TestResult% placeholder** in markdown
- **Keep "Contoso"** as company name

### 5. Validation

After creation:
- Verify all 3 files exist with matching names
- Confirm test ID is consistent across files
- Check appropriate tags in Pester test
- Ensure function sources correctly in BeforeAll block

### 6. Update Documentation

Remind user to:
- Update Docusaurus website in `website/docs/Tests/{Category}/`
- Update validation.json if creating Validating test

## Common Patterns

### Always Skip Sync Account

```powershell
if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
    continue
}
```

### Common Exclusions

```powershell
# CEOs don't need managers
if ($user.jobTitle -eq "CEO") {
    continue
}
```

### Regex Patterns for Formatting

- USA Phone (Format 1): `^\(\d{3}\)\s\d{3}-\d{4}\sx\d+$` → (555) 123-4567 x890
- USA Phone (Format 2): `^\d{3}-\d{3}-\d{4}$` → 555-123-4567
- USA Postal: `^\d{5}(-\d{4})?$` → 12345 or 12345-6789
- Canada Postal: `^[A-Z]\d[A-Z]\s?\d[A-Z]\d$` → A1A 1A1

## Output

After creating files, provide:
1. Summary of created files with paths
2. Test ID assigned
3. Next steps (update documentation, run test)
4. Command to run the test:
   ```powershell
   Invoke-Pester -Path tests/Entra/{Category}/Test-Contoso*.tests.ps1
   ```
