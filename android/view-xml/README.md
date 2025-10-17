# Android Counter App - XML Views

## Overview

This implementation uses traditional Android XML-based Views with Activities/Fragments.

## Getting Started

### Prerequisites
- Android Studio
- Basic knowledge of XML layouts
- Understanding of Android Activity lifecycle

### Setup

1. **Create New Project**
   - File > New > New Project
   - Select "Empty Activity"
   - Choose Kotlin or Java

2. **Key Files**
   ```
   app/src/main/
     java/com/example/counter/
       MainActivity.kt
     res/
       layout/
         activity_main.xml
       values/
         strings.xml
         colors.xml
   ```

### Building the Counter UI

**activity_main.xml**
```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:gravity="center">

    <TextView
        android:id="@+id/counterText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="0"
        android:textSize="48sp" />

    <Button
        android:id="@+id/incrementButton"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Increment" />

</LinearLayout>
```

**MainActivity.kt**
```kotlin
class MainActivity : AppCompatActivity() {
    private var counter = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val counterText = findViewById<TextView>(R.id.counterText)
        val incrementButton = findViewById<Button>(R.id.incrementButton)

        incrementButton.setOnClickListener {
            counter++
            counterText.text = counter.toString()
        }
    }
}
```

## Key Concepts

- **XML Layouts**: Define UI structure declaratively
- **findViewById**: Connect XML views to code
- **ViewBinding**: Modern alternative to findViewById
- **LayoutInflater**: Inflate XML into View objects

## Resources

- [Android Layouts Guide](https://developer.android.com/guide/topics/ui/declaring-layout)
- [View Binding](https://developer.android.com/topic/libraries/view-binding)
- [Material Design Components](https://material.io/develop/android)
