# Quick Reference: Creating Maester Tests with AI

## Skill Command

```
/create-maester-test <description>
```

## Examples

### Attributes Test (Missing Fields)
```
/create-maester-test Create a test to check if users are missing a business phone
```

### Formatting Test (Regex Validation)
```
/create-maester-test Create a test for USA postal codes (12345 or 12345-6789 format)
```

### Validating Test (Allowed Values)
```
/create-maester-test Create a test to check if users have approved job titles from validation.json
```

## Test ID Format

| Category | Format | Example |
|----------|--------|---------|
| Attributes | `ENTRA.UA.####` | `ENTRA.UA.1001` |
| Formatting | `ENTRA.UF.####.T##.Variant` | `ENTRA.UF.1002.T01.USA` |
| Validating | `ENTRA.UV.####` | `ENTRA.UV.1003` |

## Files Generated

Every test creates **exactly 3 files**:

1. `Test-ContosoYourTest.ps1` - PowerShell function
2. `Test-ContosoYourTest.tests.ps1` - Pester test
3. `Test-ContosoYourTest.md` - Documentation

## Required Attributes by Test Type

### Attributes Tests
- Check for **null or empty** fields
- Common: businessPhones, manager, department, jobTitle, city, country

### Formatting Tests
- Use **regex patterns** to validate format
- Common patterns:
  - USA Phone: `^\(\d{3}\)\s\d{3}-\d{4}\sx\d+$`
  - USA Postal: `^\d{5}(-\d{4})?$`
  - Canada Postal: `^[A-Z]\d[A-Z]\s?\d[A-Z]\d$`

### Validating Tests
- Check against **validation.json**
- Remember to update `tests/Entra/Validating/validation.json`

## Common Graph API Attributes

```powershell
# User attributes available via Graph API:
displayName, userPrincipalName, mail, jobTitle, department,
officeLocation, businessPhones, mobilePhone, faxNumber,
streetAddress, city, state, postalCode, country,
companyName, employeeId, employeeHireDate, usageLocation
```

## After Creating Tests

### 1. Run the Test
```powershell
Invoke-Pester -Path tests/Entra/{Category}/Test-ContosoYourTest.tests.ps1
```

### 2. Update validation.json (Validating tests only)
Add allowed values to `tests/Entra/Validating/validation.json`

### 3. Add Documentation
Create docs in `website/docs/Tests/{Category}/`

### 4. Customize Company Name
Replace "Contoso" with your company name when ready

## Common Exclusions

```powershell
# Always skip sync account
if ($user.displayName -eq "On-Premises Directory Synchronization Service Account") {
    continue
}

# CEOs don't need managers
if ($user.jobTitle -eq "CEO") {
    continue
}
```

## Validation Hook

The repository automatically validates test creation:
- ⚠️ Reminds you to create all 3 files
- ⚠️ Warns about naming inconsistencies
- ✅ Does not block creation (informational only)

## Tips

✅ **DO:**
- Be specific about what you're testing
- Mention the test category (Attributes/Formatting/Validating)
- Include exclusions in your request
- Provide regex patterns for formatting tests

❌ **DON'T:**
- Create tests without all 3 files
- Use inconsistent naming across files
- Forget to update validation.json for Validating tests
- Skip the sync account exclusion

## Need Help?

- 📖 [Full Documentation](https://devclate.github.io/Custom-Maester-Tests/docs/Getting-Started/using-ai-to-create-tests/)
- 📝 [Manual Test Creation Guide](https://devclate.github.io/Custom-Maester-Tests/docs/Getting-Started/create-a-test/)
- 🔧 [Repository Conventions](../../../AGENTS.md)
