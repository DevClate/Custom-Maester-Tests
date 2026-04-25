#!/bin/bash

# Maester Test Validation Hook
# Validates that test files follow the 3-file pattern and repository conventions

# Read input from stdin
input=$(cat)

# Extract tool name and file path
tool_name=$(echo "$input" | jq -r '.toolName // empty')
file_path=$(echo "$input" | jq -r '.args.filePath // empty')

# Only validate create_file operations for test files
if [[ "$tool_name" != "create_file" ]]; then
    echo '{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"}}'
    exit 0
fi

# Only validate if creating a test file in tests/Entra/
if [[ ! "$file_path" =~ tests/Entra/ ]]; then
    echo '{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"}}'
    exit 0
fi

# Check if this is a test file (ps1, tests.ps1, or md)
if [[ ! "$file_path" =~ \.(ps1|md)$ ]]; then
    echo '{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"}}'
    exit 0
fi

# Extract base filename without extension
base_name=$(basename "$file_path")
base_name_no_ext="${base_name%.*}"

# For .tests.ps1 files, remove the .tests part
if [[ "$base_name" =~ \.tests\.ps1$ ]]; then
    base_name_no_ext="${base_name%.tests.ps1}"
fi

# Get directory
dir_path=$(dirname "$file_path")

# Check if all 3 files will exist (or are being created)
ps1_file="$dir_path/$base_name_no_ext.ps1"
tests_file="$dir_path/$base_name_no_ext.tests.ps1"
md_file="$dir_path/$base_name_no_ext.md"

missing_files=()

# Check for existing files (don't fail if files are being created together)
if [[ ! -f "$ps1_file" && "$file_path" != "$ps1_file" ]]; then
    missing_files+=("$base_name_no_ext.ps1")
fi

if [[ ! -f "$tests_file" && "$file_path" != "$tests_file" ]]; then
    missing_files+=("$base_name_no_ext.tests.ps1")
fi

if [[ ! -f "$md_file" && "$file_path" != "$md_file" ]]; then
    missing_files+=("$base_name_no_ext.md")
fi

# If creating the first file, just warn (allow creation to proceed)
if [[ ${#missing_files[@]} -gt 0 ]]; then
    reason="Creating $base_name. Remember to create all 3 files: ${missing_files[*]}"
    echo "{\"hookSpecificOutput\": {\"hookEventName\": \"PreToolUse\", \"permissionDecision\": \"allow\"}, \"systemMessage\": \"⚠️ Maester Test Pattern: $reason\"}"
    exit 0
fi

# Allow the operation
echo '{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"}}'
exit 0
