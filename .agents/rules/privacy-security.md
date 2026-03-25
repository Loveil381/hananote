---
name: privacy-security
activation: always_on
description: HanaNote privacy and security enforcement rules
---

## Photo Storage
- ALL photos MUST be encrypted with AES-256-GCM before writing to disk
- Store encrypted files only in app sandbox, NEVER in system gallery
- iOS: Set isExcludedFromBackup=true on storage directory
- Android: android:allowBackup="false" in AndroidManifest.xml

## App Lifecycle Privacy
- When app enters background (AppLifecycleState.inactive/paused), MUST overlay a blur/solid color screen to block task-switcher snapshots
- Implement via WidgetsBindingObserver in root widget
- Use a Stack with an opaque overlay widget that appears on inactive/paused

## Clipboard
- App MUST NOT automatically read clipboard content
- Clipboard access only on explicit user action (e.g., "Paste" button)
- Never write sensitive data (drug names, dosages, lab results) to clipboard without explicit user request

## Network
- App MUST be 100% offline by default
- No telemetry, analytics, or crash reporting without explicit user opt-in
- Any network request (knowledge base update, optional OCR) requires user initiation and confirmation

## Logging
- NEVER log drug names, dosages, hormone levels, or any health data
- Debug logs may only record abstract operation types (e.g., "db_write", "file_encrypt")
- Release builds: disable ALL debug logging

## Encryption Keys
- Store derived keys in flutter_secure_storage (Keychain on iOS, KeyStore on Android)
- Use Argon2id for key derivation from user password
- Backup files (.vault) use independent password, NOT device-bound keys
- UI must clearly warn users to remember their backup password

## Notifications
- Notification text MUST be vague/generic (e.g., "Daily reminder ✓")
- NEVER include drug names, dosages, or health info in notifications
- User can customize notification text in settings

## Disguise
- Support alternate app icon and display name
- Support disguise password screen (fake calculator/notes appearance)

## Emergency Clear
- One-tap data wipe: DB + encrypted photos + preferences + caches
- Require double confirmation before execution
