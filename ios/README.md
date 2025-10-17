# iOS Counter App

## Getting Started

### Prerequisites
- macOS (required for iOS development)
- Xcode (latest version)
- Apple Developer Account (for device testing)
- Basic Swift knowledge

### Installation

1. **Install Xcode**
   - Download from the Mac App Store
   - Install Command Line Tools: `xcode-select --install`

2. **Create a New Project**
   - Open Xcode
   - File > New > Project
   - Select "App" under iOS
   - Choose SwiftUI or UIKit interface

### SwiftUI Implementation

**ContentView.swift**
```swift
import SwiftUI

struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("\(counter)")
                .font(.system(size: 48))

            Button("Increment") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

### UIKit Implementation

**ViewController.swift**
```swift
import UIKit

class ViewController: UIViewController {
    private var counter = 0
    private let counterLabel = UILabel()
    private let incrementButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Label setup
        counterLabel.text = "0"
        counterLabel.font = .systemFont(ofSize: 48)
        counterLabel.textAlignment = .center

        // Button setup
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)

        // Layout (use Auto Layout or SwiftUI)
    }

    @objc private func incrementTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
    }
}
```

### Running the App

1. **Simulator**
   - Select a simulator from the device menu
   - Click the Run button (⌘R)

2. **Physical Device**
   - Connect iOS device via USB
   - Select device from device menu
   - Click Run (requires Apple Developer Account)

### Project Structure

```
CounterApp/
  CounterApp/
    ContentView.swift    # Main view (SwiftUI)
    CounterApp.swift     # App entry point
    Assets.xcassets/     # Images and colors
  CounterAppTests/       # Unit tests
  CounterAppUITests/     # UI tests
```

### Building for Production

```bash
# Archive the app
# Product > Archive in Xcode

# Or using command line
xcodebuild archive -scheme CounterApp -archivePath ./build/CounterApp.xcarchive

# Export for App Store
xcodebuild -exportArchive -archivePath ./build/CounterApp.xcarchive \
  -exportPath ./build -exportOptionsPlist exportOptions.plist
```

## Key Concepts

### SwiftUI
- **@State**: Property wrapper for local state
- **@StateObject/@ObservableObject**: For complex state management
- **Views**: Structs that conform to the View protocol
- **Declarative**: Describe what the UI should look like

### UIKit
- **ViewControllers**: Manage view hierarchies
- **Delegates**: Handle events and callbacks
- **Auto Layout**: Constraint-based layout system
- **Imperative**: Describe how to update the UI

## Resources

- [Swift Documentation](https://swift.org/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
