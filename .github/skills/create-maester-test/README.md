# Create Maester Test Skill

This skill automates the creation of custom Maester tests following the repository's 3-file pattern.

## Structure

```
create-maester-test/
├── SKILL.md                           # Main skill instructions
└── references/                        # Templates
    ├── attributes-template.ps1        # Template for Attributes tests
    ├── formatting-template.ps1        # Template for Formatting tests
    ├── validating-template.ps1        # Template for Validating tests
    ├── pester-template.tests.ps1      # Template for Pester test files
    └── markdown-template.md           # Template for documentation
```

## Usage

In GitHub Copilot Chat:

```
/create-maester-test Create a test to check if users have valid phone numbers
```

The skill will:
1. Determine the appropriate test category
2. Ask for missing details (attributes, messages, remediation)
3. Generate all 3 required files
4. Provide next steps

## Templates

### Attributes Template

For tests checking missing required attributes. Placeholders:
- `{PURPOSE}` - Test function name suffix
- `{ATTRIBUTES}` - Graph API Select attributes
- `{ATTRIBUTE}` - Single attribute being checked
- `{SUCCESS_MESSAGE}` - Message when all users pass
- `{FAILURE_MESSAGE}` - Message when users fail

### Formatting Template

For tests validating format with regex. Placeholders:
- `{PURPOSE}` - Test function name suffix
- `{ATTRIBUTES}` - Graph API Select attributes
- `{ATTRIBUTE}` - Attribute being validated
- `{REGEX_PATTERN}` - Regex for format validation
- `{SUCCESS_MESSAGE}` - Success message
- `{FAILURE_MESSAGE}` - Failure message

### Validating Template

For tests checking against validation.json. Placeholders:
- `{PURPOSE}` - Test function name suffix
- `{VALUES}` - Array name from validation.json
- `{ATTRIBUTES}` - Graph API Select attributes
- `{ATTRIBUTE}` - Attribute being validated
- `{SUCCESS_MESSAGE}` - Success message
- `{FAILURE_MESSAGE}` - Failure message

### Pester Template

For Pester test files. Placeholders:
- `{PURPOSE}` - Test function name suffix
- `{TEST_ID}` - Test ID (e.g., ENTRA.UA.1001)
- `{CATEGORY_TAGS}` - Additional tags for test category
- `{DESCRIPTION}` - Test description
- `{REASON}` - Reason for the test

### Markdown Template

For documentation files. Placeholders:
- `{WHAT_THE_TEST_VALIDATES}` - What the test checks
- `{BUSINESS_REQUIREMENT}` - Company policy requirement
- `{REASON}` - Why it's important
- `{WITH_THE_ISSUE}` - Description of issue
- `{FORM_TITLE}` - Service Now form title
- `{PATH}` - Service Now path
- `{ACTION}` - Required action
- `{ROLE}` - Escalation role
- `{LINK_TITLE}` - Additional link title

## Extending

To add new test types:

1. Create a new template in `references/`
2. Update `SKILL.md` to reference the new template
3. Add documentation in the Docusaurus site

## Related Files

- Validation Hook: `.github/hooks/validate-maester-test.json`
- Documentation: `website/docs/Getting-Started/using-ai-to-create-tests.md`
