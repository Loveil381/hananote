# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in HanaNote, please report it responsibly.

**Do NOT open a public GitHub issue for security vulnerabilities.**

Instead, please contact us directly at the email listed in the repository owner's profile.

## Security Architecture

HanaNote takes a defense-in-depth approach to protecting your health data:

### Encryption Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| Key Derivation | Argon2id (64MB, 3 iter, 4 para) | Derive encryption key from PIN |
| Key Storage | Verification hash only (SHA-256) | Raw key never persisted to disk |
| Database | SQLCipher | All structured data encrypted at rest |
| Files | AES-256-GCM | Photos encrypted in memory before writing |
| Secrets | Platform Keychain / KeyStore | Salt and key hash stored in secure enclave |

### Privacy Guarantees

- **Offline-first**: Core functionality requires zero network access
- **No telemetry**: No analytics, crash reporting, or tracking SDKs
- **No cloud sync**: All data stays on your device
- **App-switch blur**: Content hidden in recent apps
- **No clipboard exposure**: Sensitive data never written to clipboard

### Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.x   | Yes       |
