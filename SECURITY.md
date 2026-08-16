# 🔒 Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| latest  | ✅ Yes             |
| < latest| ❌ No              |

## Security Considerations

### Configuration Security
- The `local.json` contains only public connection parameters
- **No credentials** are stored in this repository
- API tokens and passwords should be set up via proper environment variables

### Network Security
All connections use:
- TLS 1.2+ encryption for web interface
- AES-128-GCM for data encryption
- End-to-end encryption with RSA-2048 key exchange

## Reporting a Vulnerability

If you discover a security vulnerability within this project:

1. **DO NOT** create a public issue
2. Email the maintainer directly with:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Proposed fix (if any)
3. You should receive a response within **48 hours**
4. A fix will be prioritized based on severity

## Third-Party Security

This project downloads and executes third-party software (Rust Desk). Security considerations:

1. **Checksum Verification**: All downloads should be verified against official checksums
2. **Signature Validation**: GPG signatures should be validated where available
3. **Least Privilege**: Installers should be run with minimal required permissions
4. **Network Isolation**: The Rust Desk server (rd.wickedyoda.com) should be isolated on Tailscale network

## Secure Deployment Checklist

- [ ] Verify Rust Desk binaries against official checksums
- [ ] Use HTTPS/TLS for all communications
- [ ] Keep server keys securely stored
- [ ] Regularly update Rust Desk server
- [ ] Monitor server logs for suspicious activity
- [ ] Use firewall rules to restrict access to ports 21114-21118
- [ ] Ensure SSH keys are properly secured with passphrase

## Dependency Security

This repository is scanned weekly via:
- **CodeQL**: Static code analysis for all source files
- **Trivy**: Vulnerability scanning for dependencies
- **Gitleaks**: Detection of accidentally committed secrets
- **Dependency Review**: GitHub's automated dependency analysis

## Incident Response

In case of a security incident:
1. Immediately revoke compromised keys/tokens
2. Rotate the server key (`KEY_FILE` in hbbs/hbbr)
3. Update `local.json` with new key
4. Notify all client users to update configuration
5. Audit server logs for impact assessment
