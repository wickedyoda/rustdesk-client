# Contributing Guidelines

## Welcome!

Thanks for your interest in contributing to the Rust Desk Wickedyoda client project!

## How to Contribute

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/my-feature`
3. **Make your changes** following the coding standards below
4. **Run validation**: `pre-commit run --all-files`
5. **Commit** with a descriptive message
6. **Push** to your fork: `git push origin feature/my-feature`
7. **Open a Pull Request**

## Coding Standards

### Scripts (Bash)
- Use `#!/bin/bash` shebang
- Include `set -e` for error handling
- Comment complex sections
- Test on multiple Linux distributions

### Scripts (PowerShell)
- Use `# PowerShell` comment header
- Include error handling with `$ErrorActionPreference`
- Test on Windows 10/11

### Configuration (JSON)
- Use 2-space indentation
- Validate with `python3 -m json.tool`

### Workflows (YAML)
- Use 2-space indentation
- Follow GitHub Actions best practices
- Include descriptive names and comments

## Pull Request Process

1. PR must pass all CI checks (Security Scan, CI Validation)
2. Code must be reviewed by at least one maintainer
3. All security alerts must be addressed before merge
4. Update documentation if changing user-facing features

## Security Disclosures

**DO NOT** report security vulnerabilities in public issues. Email **security@wickedyoda.dev** instead.

## Testing Checklist

- [ ] Script runs without errors on target platform
- [ ] JSON/YAML files are valid
- [ ] Shell scripts pass `shellcheck`
- [ ] PowerShell scripts pass `PSScriptAnalyzer`
- [ ] Markdown files are grammatically correct

## Questions?

Open an issue or contact the maintainers.
