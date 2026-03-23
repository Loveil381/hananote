---
activation: always_on
---

# HanaNote Flutter Project Rules

## Project Context
HanaNote is a Flutter 3.x privacy-first health tracking app for HRT management.
Target: iOS + Android. Offline-first. All data encrypted locally.
Tech stack: flutter_bloc, go_router, get_it+injectable, freezed, sqflite_sqlcipher,
pointycastle, fl_chart, flutter_local_notifications, camera.

## Directory Structure (Feature-First)
lib/ ├── app/ # App-level: MaterialApp, router, theme, DI setup │ ├── app.dart │ ├── router.dart │ ├── theme/ │ └── di/ ├── core/ # Shared infrastructure │ ├── crypto/ # CryptoEngine, key management │ ├── database/ # SecureDatabase wrapper │ ├── storage/ # EncryptedFileStore │ ├── error/ # Failure types │ ├── utils/ # Extensions, helpers │ └── l10n/ # Localization ├── features/ # Feature modules │ ├── auth/ # App lock, biometrics, disguise │ ├── medication/ # Drug management, reminders │ │ ├── data/ │ │ │ ├── datasources/ │ │ │ ├── models/ │ │ │ └── repositories/ │ │ ├── domain/ │ │ │ ├── entities/ │ │ │ ├── repositories/ │ │ │ └── usecases/ │ │ └── presentation/ │ │ ├── bloc/ │ │ ├── pages/ │ │ └── widgets/ │ ├── blood_test/ │ ├── measurement/ │ ├── photo/ │ ├── journal/ │ ├── timeline/ │ ├── simulator/ # PK simulator │ ├── knowledge/ │ ├── analytics/ │ └── settings/ └── main.dart


## Feature Module Rules
- Each feature is self-contained with data/domain/presentation layers.
- Features communicate ONLY through their public domain interfaces (entities + repository abstractions).
- No cross-feature widget imports. Shared widgets go in `core/widgets/`.
- No feature depends on another feature's data layer.

## State Management
- Use Cubit for simple state, BLoC for complex event-driven state.
- State classes use Freezed: `@freezed class MedicationState with _$MedicationState`.
- Emit new state, never mutate. All states must be `copyWith`-able.
- Loading/Error/Success pattern: every feature state has these three substates minimum.

## Data Models
- Domain entities: plain Dart classes via Freezed, in `domain/entities/`.
- Data models: Freezed classes with `fromJson`/`toJson`, in `data/models/`.
- NEVER use domain entities directly for DB/serialization. Always map between layers.

## Database
- All tables defined in `core/database/tables/`.
- Migrations in `core/database/migrations/`.
- DB version tracked. Every schema change = new migration.
- All queries in Repository implementations, never in BLoC/UI.

## Localization
- All user-facing strings in ARB files: `lib/core/l10n/arb/app_zh.arb`, `app_ja.arb`, `app_en.arb`.
- NEVER hardcode strings in widgets.
- Medical terms include all three languages in a lookup table.

## Notifications
- Notification text MUST be customizable by user. Default: vague text like "Daily reminder ✓".
- NEVER include drug names, health terms, or any sensitive content in notification payload.
