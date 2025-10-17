# Flutter Counter App

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code with Flutter extensions
- Xcode (for iOS development on macOS)

### Installation

1. **Install Flutter**
   ```bash
   # Follow the official guide at https://flutter.dev/docs/get-started/install
   ```

2. **Verify Installation**
   ```bash
   flutter doctor
   ```

3. **Create a New Flutter Project**
   ```bash
   flutter create counter_app
   cd counter_app
   ```

### Running the App

```bash
# Run on connected device or emulator
flutter run

# Run on specific device
flutter devices  # List available devices
flutter run -d <device-id>

# Hot reload: Press 'r' in terminal
# Hot restart: Press 'R' in terminal
```

### Project Structure

```
lib/
  main.dart          # App entry point
  screens/           # UI screens
  widgets/           # Reusable widgets
  models/            # Data models
  services/          # Business logic
```

### Building for Production

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Samples](https://flutter.dev/community/samples)
