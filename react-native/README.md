# React Native Counter App

## Getting Started

### Prerequisites
- Node.js (LTS version)
- npm or yarn
- React Native CLI or Expo CLI
- Android Studio (for Android development)
- Xcode (for iOS development on macOS)

### Installation

1. **Install Node.js**
   ```bash
   # Download from https://nodejs.org/
   node --version
   npm --version
   ```

2. **Install React Native CLI**
   ```bash
   npm install -g react-native-cli
   ```

   **Or use Expo (recommended for beginners)**
   ```bash
   npm install -g expo-cli
   ```

### Create a New Project

**Using React Native CLI:**
```bash
npx react-native init CounterApp
cd CounterApp
```

**Using Expo:**
```bash
npx create-expo-app CounterApp
cd CounterApp
```

### Building the Counter App

**App.tsx / App.js**
```javascript
import React, { useState } from 'react';
import {
  SafeAreaView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

export default function App() {
  const [counter, setCounter] = useState(0);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.content}>
        <Text style={styles.counterText}>{counter}</Text>
        <TouchableOpacity
          style={styles.button}
          onPress={() => setCounter(counter + 1)}>
          <Text style={styles.buttonText}>Increment</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  counterText: {
    fontSize: 48,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  button: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 30,
    paddingVertical: 15,
    borderRadius: 8,
  },
  buttonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
});
```

### Running the App

**React Native CLI:**
```bash
# Android
npx react-native run-android

# iOS (macOS only)
npx react-native run-ios

# Start Metro bundler
npx react-native start
```

**Expo:**
```bash
# Start development server
npx expo start

# Or
npm start

# Scan QR code with Expo Go app on your phone
# Or press 'a' for Android, 'i' for iOS simulator
```

### Project Structure

```
CounterApp/
  src/
    components/      # Reusable components
    screens/         # Screen components
    navigation/      # Navigation setup
    hooks/           # Custom hooks
    utils/           # Utility functions
  App.tsx           # App entry point
  package.json
  tsconfig.json
```

### Building for Production

**React Native CLI:**
```bash
# Android
cd android
./gradlew assembleRelease

# iOS
cd ios
xcodebuild -scheme CounterApp -configuration Release
```

**Expo:**
```bash
# Build for both platforms
eas build --platform all

# Or specific platform
eas build --platform android
eas build --platform ios
```

## Key Concepts

- **Components**: Building blocks of React Native apps
- **State**: Use `useState` hook for component state
- **Props**: Pass data between components
- **Hooks**: Use React hooks for side effects and state
- **StyleSheet**: Style components using JavaScript objects
- **Native Modules**: Bridge to native iOS/Android code

## State Management Options

```javascript
// Local State (useState)
const [counter, setCounter] = useState(0);

// Context API
const CounterContext = React.createContext();

// Redux
import { useSelector, useDispatch } from 'react-redux';

// Zustand (lightweight)
import create from 'zustand';
```

## Resources

- [React Native Documentation](https://reactnative.dev/docs/getting-started)
- [Expo Documentation](https://docs.expo.dev/)
- [React Native Directory](https://reactnative.directory/)
- [React Hooks](https://react.dev/reference/react)
- [React Native Community](https://github.com/react-native-community)
