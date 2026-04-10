<p align="center">
  <img src="assets/icon/app_icon.png" width="120" alt="HanaNote Icon" />
</p>

<h1 align="center">HanaNote</h1>

<p align="center">
  <strong>Privacy-first HRT health tracker for the transgender community</strong>
</p>

<p align="center">
  <a href="#features">Features</a> &bull;
  <a href="#screenshots">Screenshots</a> &bull;
  <a href="#download">Download</a> &bull;
  <a href="#architecture">Architecture</a> &bull;
  <a href="#development">Development</a> &bull;
  <a href="#contributing">Contributing</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.24+-02569B?logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.5+-0175C2?logo=dart" alt="Dart" />
  <img src="https://img.shields.io/badge/License-Proprietary-red" alt="License" />
  <img src="https://img.shields.io/badge/i18n-zh%20%7C%20en%20%7C%20ja-blue" alt="Languages" />
  <img src="https://github.com/Loveil381/hananote/actions/workflows/ci.yml/badge.svg" alt="CI" />
</p>

---

> *Your safest private space to track your body's journey.*

HanaNote is a full-featured, offline-first health tracking app built for MTF transgender individuals undergoing hormone replacement therapy. Every byte of your data is encrypted. Nothing leaves your device.

---

## Why HanaNote?

Over 84% of transgender hormone users in China lack adequate medical guidance. HanaNote bridges that gap with a scientific, privacy-obsessed, and emotionally warm companion app.

| What makes it different | |
|---|---|
| **Zero-knowledge encryption** | Argon2id key derivation + SQLCipher database + AES-256-GCM file encryption. Your data is unreadable without your PIN. |
| **Dual PK simulator** | Two pharmacokinetic engines (V2 + Hana-PK) predict blood estradiol levels across 7 drug preparations. Includes MAP calibration against real blood tests. |
| **All-in-one tracking** | Medications, blood tests, body measurements, encrypted photos, mood journals, and a cross-feature timeline -- in a single app. |
| **HRT drug reference** | Built-in evidence-based safety guide from [HRT Yakuten](https://hrtyaku.com), accessible without leaving the app. |
| **Offline-first** | Core functionality requires zero network access. Your health data never touches a server. |
| **Tri-lingual** | Chinese, English, and Japanese -- designed for users across China, Japan, and Southeast Asia. |

---

## Features

### Daily Tracking
- **Today Tab** -- personalized greeting, medication schedule with countdown timers, daily motivational quotes
- **Medication management** -- add drugs, set schedules (daily/weekly/custom), track doses, monitor inventory
- **Notification reminders** -- scheduled local notifications with per-drug control

### Health Records
- **Blood test logging** -- record hormone panels (E2, T, PRL, P4, LH, FSH, SHBG) with target range indicators from WPATH/Endocrine Society guidelines
- **Body measurements** -- track 9 measurement types (bust, waist, hip, weight, etc.) over time
- **Encrypted photo journal** -- end-to-end encrypted photo storage with thumbnail caching
- **Mood diary** -- daily journal entries with mood tracking and tags

### Analysis
- **Trend charts** -- hormone level trends with configurable time ranges (1M / 3M / 6M / 1Y / All)
- **PK Simulator** -- predict blood drug concentrations for injections (EV, EC, EEn), oral, sublingual, patch, and gel preparations
- **Timeline** -- unified chronological view across all features with milestone celebrations

### Privacy & Security
- **6-digit PIN + biometric unlock** (fingerprint / face)
- **Argon2id** key derivation (64MB memory, 3 iterations, 4 parallelism)
- **SQLCipher** encrypted database -- all structured data encrypted at rest
- **AES-256-GCM** encrypted photo storage -- photos encrypted in memory before writing to disk
- **App-switch blur overlay** -- hides content in recent apps
- **Data wipe** -- emergency full data destruction

### In-app Updates
- Automatic update checking via GitHub Releases
- One-tap download and install for new versions

---

## Screenshots

> *Coming soon -- screenshots will be added before the first public release.*

---

## Download

### Android APK

Download the latest release from [GitHub Releases](https://github.com/Loveil381/hananote/releases/latest).

The app checks for updates automatically on launch. When a new version is available, you'll see an update prompt.

### iOS

iOS distribution is planned for a future release.

---

## Architecture

```
Presentation (Flutter Widgets + BLoC/Cubit)
     |
  Domain (Use Cases + Entities + Services)
     |
  Data (Repository Impl + DataSources + CryptoEngine)
```

**Feature-first Clean Architecture** with 10 independent feature modules:

```
lib/features/
  auth/          # PIN + biometric authentication
  blood_test/    # Hormone panel tracking
  journal/       # Mood diary + Record tab
  knowledge/     # HRT drug reference (WebView)
  measurement/   # Body measurements
  medication/    # Drug management + schedules
  notification/  # Reminder settings
  photo/         # Encrypted photo gallery
  settings/      # Profile + app preferences
  simulator/     # PK pharmacokinetic engine
  timeline/      # Cross-feature event aggregation
```

### Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.24+ / Dart 3.5+ |
| State Management | flutter_bloc (BLoC + Cubit) |
| Navigation | go_router |
| DI | get_it + injectable |
| Database | sqflite_sqlcipher |
| Encryption | pointycastle (AES-256-GCM) + hashlib (Argon2id + SHA-256) |
| Secure Storage | flutter_secure_storage |
| Serialization | freezed + json_serializable |
| Error Handling | fpdart (Either\<Failure, T\>) |
| Charts | fl_chart |
| Linting | very_good_analysis |
| Testing | bloc_test + mocktail |
| CI/CD | GitHub Actions |

### Design System

The visual language is called **Digital Stationery** -- a warm, anime-inspired aesthetic that feels like writing on premium Japanese stationery.

- **Sakura Pink** `#864E5A` -- primary, representing gentle strength
- **Lavender** `#745475` -- secondary, calm and soothing
- **Cream** `#FFF8F1` -- background, like fine paper
- **No-Line Rule** -- boundaries defined by tonal layering, never hard lines
- **Glassmorphism** navigation with backdrop blur
- **Plus Jakarta Sans** typography

---

## Development

### Prerequisites

- Flutter 3.24.0+
- Dart SDK 3.5.0+
- Android SDK 34 (for Android builds)

### Setup

```bash
# Clone the repository
git clone https://github.com/Loveil381/hananote.git
cd hananote

# Install dependencies
flutter pub get

# Generate code (Freezed models, DI config, l10n)
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n

# Run analysis
dart analyze

# Run tests
flutter test

# Run the app
flutter run
```

### Release Build

```bash
# Build release APK
flutter build apk --release

# Or trigger via git tag (GitHub Actions)
git tag v1.0.0
git push origin --tags
# → Automatically builds APK and creates GitHub Release
```

### Project Structure

```
lib/
  app/             # App entry, router, DI, theme
  core/            # Shared infrastructure
    crypto/        # CryptoEngine, KeyManager
    database/      # SecureDatabase, migrations
    error/         # ErrorBoundary, Failure types
    l10n/          # Localization (ARB + enum extensions)
    notifications/ # NotificationService
    update/        # GitHub release update checker
  features/        # Feature modules (Clean Architecture)
```

---

## Contributing

HanaNote is currently in early development. Contributions, bug reports, and feature requests are welcome via [GitHub Issues](https://github.com/Loveil381/hananote/issues).

### Commit Convention

```
type(scope): description

Types: feat, fix, refactor, test, docs, chore, style
```

### Code Guidelines

- Clean Architecture boundaries are strictly enforced
- Domain layer must have zero Flutter dependencies
- All user-visible strings must use ARB localization
- All new code requires tests
- Privacy is non-negotiable -- no plaintext health data in logs or storage

---

## Acknowledgments

- [estrannaise.js](https://github.com/WHSAH/estrannaise.js) -- PK model reference
- [Transfem Science](https://transfemscience.org) -- pharmacokinetic research
- [HRT Yakuten](https://hrtyaku.com) -- evidence-based drug reference
- [WPATH SOC8](https://www.wpath.org/soc8) -- clinical guidelines

---

## License

This project is proprietary software. All rights reserved.

---

<p align="center">
  <sub>Built with care for those who deserve a safe space to track their journey.</sub>
</p>
