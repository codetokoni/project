# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter application (Dart SDK ^3.10.8) targeting Android, iOS, Windows, Linux, macOS, and Web. Currently a starter project with the default counter demo.

## Common Commands

```bash
flutter pub get              # Install dependencies
flutter run                  # Run on attached device/emulator
flutter test                 # Run all tests
flutter test test/widget_test.dart  # Run a single test file
flutter analyze              # Static analysis (uses flutter_lints)
flutter build apk            # Build Android
flutter build windows        # Build Windows
flutter build web            # Build Web
```

## Architecture

- **lib/main.dart** — Single entry point; contains `MyApp` (root MaterialApp widget) and `MyHomePage` (stateful counter widget)
- **test/** — Widget tests using `flutter_test`
- Platform directories (android/, ios/, windows/, linux/, macos/, web/) contain platform-specific runner code managed by Flutter

## Linting

Uses `package:flutter_lints/flutter.yaml` rules configured in `analysis_options.yaml`.
