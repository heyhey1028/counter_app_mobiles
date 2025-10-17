# Android Counter App

## Getting Started

This directory contains Android implementations using different UI approaches:
- **view-xml**: Traditional XML-based Views
- **compose**: Modern Jetpack Compose

### Prerequisites
- Android Studio (latest stable version)
- JDK 11 or higher
- Android SDK (API level 24+)
- Gradle

### Installation

1. **Install Android Studio**
   - Download from [developer.android.com](https://developer.android.com/studio)
   - Install Android SDK and build tools

2. **Create a New Android Project**
   ```bash
   # Using Android Studio:
   # File > New > New Project > Empty Activity (for XML)
   # File > New > New Project > Empty Compose Activity (for Compose)
   ```

### Project Setup

```bash
# Clone and open in Android Studio
cd counter_app_mobiles/android
# Open the project folder in Android Studio
```

### Running the App

1. **Using Android Studio**
   - Click the "Run" button (green play icon)
   - Select a device or emulator

2. **Using Command Line**
   ```bash
   # Run on connected device
   ./gradlew installDebug

   # Run tests
   ./gradlew test
   ```

### Project Structure

```
app/
  src/
    main/
      java/          # Kotlin/Java source files
      res/           # Resources (layouts, drawables, etc.)
      AndroidManifest.xml
  build.gradle       # App-level build configuration
build.gradle         # Project-level build configuration
```

### Building for Production

```bash
# Generate signed APK
./gradlew assembleRelease

# Generate App Bundle (recommended for Play Store)
./gradlew bundleRelease
```

## Resources

- [Android Developer Guide](https://developer.android.com/guide)
- [Android Samples](https://github.com/android)
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
