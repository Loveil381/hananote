# HanaNote — Agent Rules

## Product Context
HanaNote is a privacy-first Flutter app for MTF HRT health management.
Core users: Chinese/Japanese/SEA trans women, 16-35.
Core promise: "Your safest private space to interact with your body changes."
All technical decisions serve this product vision.

## Build & Test
```bash
# Build
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test

# Run
flutter run

# Format
dart format .
```

## Verification Checklist (run after every task)
- [ ] flutter analyze — zero warnings
- [ ] flutter test — all pass
- [ ] dart format --set-exit-if-changed . — no formatting issues
- [ ] No plaintext user data anywhere in code or logs
- [ ] No system photo gallery imports
- [ ] All new public APIs have dartdoc comments
- [ ] All new code has corresponding tests

## Architecture Rules
- Clean Architecture: Presentation → BLoC → Domain → Data
- Feature-First directory structure (see .agents/rules/flutter-project.md)
- Domain layer: zero external dependencies
- Error handling: Either<Failure, T> — no naked try-catch in business logic
- All data persistence goes through CryptoEngine

## Critical Don'ts
- NEVER store data in system photo gallery
- NEVER log health data, keys, or passwords
- NEVER use git reset --hard or rm -rf
- NEVER hardcode user-facing strings (use l10n)
- NEVER import from another feature's data layer
- NEVER use dynamic type unless parsing JSON

## Naming Conventions
- Files: snake_case.dart
- Classes: PascalCase
- Variables/functions: camelCase
- BLoC events: PascalCase verbs (LoadMedications, AddDrug, DeleteDrug)
- BLoC states: PascalCase adjectives (MedicationLoading, MedicationLoaded, MedicationError)
- Database tables: snake_case plural (medications, blood_tests)

## Commit Convention
Format: type(scope): description
Types: feat, fix, refactor, test, docs, chore, style
Scopes: core, medication, blood-test, measurement, photo, auth, journal, simulator
Example: `feat(medication): add injection cycle calculator`
