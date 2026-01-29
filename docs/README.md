# RadiRight Documentation

RadiRight is a Flutter mobile application that helps doctors choose appropriate radiological exams based on ACR (American College of Radiology) Appropriateness Criteria.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Localization](#localization)

## Overview

RadiRight provides:
- **Decision Tree Navigation**: Guide doctors through clinical scenarios to reach imaging recommendations
- **ACR Criteria Integration**: Evidence-based appropriateness ratings for imaging procedures
- **Bilingual Support**: Full Arabic and English support with RTL layouts
- **Subscription Management**: Trial period and subscription tracking
- **Assessment History**: Track and review past assessments

## Architecture

The project follows Clean Architecture principles:

```
lib/
├── app/           # Application-level configuration
│   ├── config/    # App configuration
│   ├── routing/   # Navigation and routes
│   └── theme/     # Theme and styling
├── core/          # Core utilities and services
├── features/      # Feature modules
│   ├── auth/
│   ├── assessment/
│   ├── subscription/
│   ├── history/
│   ├── home/
│   └── settings/
├── shared/        # Shared models and utilities
└── l10n/          # Localization files
```

Each feature follows the structure:
- `data/` - Data sources and repositories
- `domain/` - Models, enums, and services
- `presentation/` - Providers, screens, and widgets

## Features

### Authentication
- Email/password login and registration
- Firebase Authentication backend
- Auto-creation of 7-day trial on registration

### Subscription
- Trial (7 days free)
- Monthly ($99)
- Yearly ($999)
- Contact-based subscription activation (V1)

### Assessment
- Panel selection (MSK in V1)
- Topic selection with search
- Sequential question navigation
- Imaging recommendations with appropriateness ratings

### History
- Firebase-synced assessment history
- View past assessments
- Delete individual or all history

## Getting Started

### Prerequisites
- Flutter SDK 3.9+
- Firebase CLI
- FlutterFire CLI
- Android Studio / VS Code

### Quick Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   ```bash
   # Install FlutterFire CLI (if not installed)
   dart pub global activate flutterfire_cli

   # Configure Firebase (follow prompts)
   flutterfire configure
   ```

   **For detailed Firebase setup instructions, see [FIREBASE_SETUP.md](./FIREBASE_SETUP.md)**

4. Generate code:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   flutter gen-l10n
   ```

5. Run the app:
   ```bash
   flutter run
   ```

### Firebase Setup (Detailed)

The app requires Firebase for:
- **Authentication**: Email/password sign-in
- **Firestore**: User data, subscriptions, and assessment history

See the comprehensive **[Firebase Setup Guide](./FIREBASE_SETUP.md)** for:
- Creating a Firebase project
- Configuring Firestore collections
- Setting up security rules
- Creating required indexes
- Troubleshooting common issues

## Configuration

### App Configuration
Edit `lib/app/config/app_config.dart`:

```dart
class AppConfig {
  static const String contactEmail = 'your@email.com';
  static const String contactPhone = 'your-phone';
  static const int trialDays = 7;
  static const double monthlyPrice = 99.0;
  static const double yearlyPrice = 999.0;
}
```

### Decision Trees
Add or modify decision trees in `assets/data/decision_trees/`.

## Localization

The app supports:
- English (en) - Default
- Arabic (ar) - RTL support

Add translations in:
- `lib/l10n/app_en.arb`
- `lib/l10n/app_ar.arb`

Regenerate with:
```bash
flutter gen-l10n
```
