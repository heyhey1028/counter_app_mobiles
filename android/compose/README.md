# Android Counter App - Jetpack Compose

## Overview

This implementation uses Jetpack Compose, Android's modern declarative UI toolkit.

## Getting Started

### Prerequisites
- Android Studio Arctic Fox or later
- Kotlin knowledge
- Basic understanding of declarative UI

### Setup

1. **Create New Project**
   - File > New > New Project
   - Select "Empty Compose Activity"
   - Minimum API level 21+

2. **Dependencies** (build.gradle.kts)
   ```kotlin
   dependencies {
       implementation("androidx.compose.ui:ui:1.5.0")
       implementation("androidx.compose.material3:material3:1.1.0")
       implementation("androidx.activity:activity-compose:1.7.0")
   }
   ```

### Building the Counter UI

**MainActivity.kt**
```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterApp()
        }
    }
}

@Composable
fun CounterApp() {
    var counter by remember { mutableStateOf(0) }

    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = counter.toString(),
            fontSize = 48.sp
        )

        Spacer(modifier = Modifier.height(16.dp))

        Button(onClick = { counter++ }) {
            Text("Increment")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun CounterPreview() {
    CounterApp()
}
```

## Key Concepts

- **Composables**: UI building blocks annotated with @Composable
- **State**: Use `remember` and `mutableStateOf` for state management
- **Recomposition**: UI automatically updates when state changes
- **Modifiers**: Chain modifiers to style and position composables
- **Preview**: Use @Preview to see UI in Android Studio

## State Management

```kotlin
// Local state
var counter by remember { mutableStateOf(0) }

// ViewModel state
class CounterViewModel : ViewModel() {
    var counter by mutableStateOf(0)
        private set

    fun increment() {
        counter++
    }
}
```

## Resources

- [Compose Documentation](https://developer.android.com/jetpack/compose)
- [Compose Samples](https://github.com/android/compose-samples)
- [Compose Pathway](https://developer.android.com/courses/pathways/compose)
- [Material 3 Components](https://developer.android.com/jetpack/compose/designsystems/material3)
