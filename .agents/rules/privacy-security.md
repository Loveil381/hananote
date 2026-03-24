---
activation: always_on
---

# HanaNote — Privacy & Security Enforcement Rules

These are NON-NEGOTIABLE. Violating any is a 🔴 Critical bug.

## Photo Storage
- ALL photos encrypted with AES-256-GCM before writing to disk
- Photos stored in app sandbox ONLY. NEVER use MediaStore, PhotoKit, or system gallery APIs
- iOS: set `isExcludedFromBackup = true` on photo directories
- Android: set `android:allowBackup="false"` in AndroidManifest.xml
- NEVER write photo bytes to a temp file unencrypted, even briefly

## App Lifecycle Privacy
- When app enters background (AppLifecycleState.inactive / paused), MUST overlay
  a blur or solid color screen to prevent task switcher from capturing sensitive content
- Implement via WidgetsBindingObserver in the root widget
- The overlay must cover the ENTIRE screen, not just a portion

## Clipboard
- App MUST NOT automatically read clipboard on launch or resume
- Clipboard access only on explicit user action (user taps a "Paste" button)
- NEVER write sensitive data (drug names, lab values, passwords) to system clipboard

## Network
- Core functions MUST work 100% offline with zero network calls
- No telemetry, analytics, or crash reporting without explicit user opt-in
- If network permission not granted: graceful degradation, no crashes

## Logging
- NEVER log: drug names, dosages, lab values, photo paths, user notes, passwords, keys
- Debug builds: log anonymized operation types only ("dose_logged", "photo_encrypted")
- Release builds: crash reports only, with user consent

## Encryption Keys
- Stored ONLY in flutter_secure_storage (iOS Keychain / Android KeyStore)
- Key derivation from user password via Argon2id or PBKDF2
- Backup files (.vault) encrypted with separate user-chosen backup password
- NEVER store keys in SharedPreferences, local files, or source code

## Notifications
- Default text: "日常提醒 ✓" — zero health/drug info
- Text MUST be user-customizable
- NEVER include drug names, dosages, or health terms in notification payload or title

## Disguise
- Support alternate app icons (iOS Alternate Icons API / Android Activity Alias)
- Support custom display name on home screen
- Disguise password → innocent UI; real password → HanaNote

## Emergency Clear
- One-tap wipe: DB + photos + preferences + cached thumbnails
- Require double confirmation (prevent accidental trigger)
- After clear, app shows fresh onboarding state
