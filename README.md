# DesignSystemKit

A comprehensive SwiftUI design system library that provides consistent UI components, colors, typography, spacing, and interactive elements for iOS applications.

## 📋 Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Features](#features)
- [Usage](#usage)
  - [Colors](#colors)
  - [Typography](#typography)
  - [Spacing](#spacing)
  - [Corner Radius](#corner-radius)
  - [Buttons](#buttons)
  - [Haptic Feedback](#haptic-feedback)
  - [Toast Notifications](#toast-notifications)
  - [Modifiers](#modifiers)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

## Overview

DesignSystemKit is a Swift Package Manager library that provides a complete design system for iOS applications built with SwiftUI. It includes predefined colors, typography, spacing, interactive components, and modifiers that ensure consistency across your app's user interface.

## Requirements

- iOS 16.0+
- Swift 6.0+
- Xcode 15.0+

## Installation

Add DesignSystemKit to your Swift Package Manager dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/dimzfresh/DesignSystemKit.git", from: "1.0.0")
]
```

## Features

### 🎨 Design Tokens
- **Colors**: Semantic color system with light/dark mode support
- **Typography**: Comprehensive font system with multiple weights and sizes
- **Spacing**: Consistent spacing scale (2pt to 32pt)
- **Corner Radius**: Standardized border radius values

### 🧩 Components
- **Buttons**: Multiple styles (Primary, Secondary, Ghost) with different sizes
- **Toast Notifications**: Built-in toast component for user feedback
- **Color Views**: Dedicated color display components

### 🔧 Modifiers
- **Shadow**: Consistent shadow application
- **Haptic Feedback**: Integrated haptic feedback system
- **Spacing**: Automatic spacing between views
- **Corner Radius**: Easy corner radius application

## Usage

### Colors

DesignSystemKit provides a semantic color system with four main categories:

```swift
import DesignSystemKit

// Text and Icons
Text("Hello World")
    .dsForegroundColor(.textAndIcons(.primary))

// Backgrounds
Rectangle()
    .dsBackgroundColor(.background(.green))

// Accent colors
Circle()
    .dsBackgroundColor(.accent(.accent))

// Technical colors (errors, etc.)
Text("Error message")
    .dsForegroundColor(.technical(.error))

// Dynamic colors for light/dark mode
Rectangle()
    .dsBackgroundColor(.dynamic(
        light: .white,
        dark: .black
    ))
```

### Typography

The library includes a comprehensive typography system:

```swift
// Titles
Text("Main Title")
    .dsFont(.titleH1)

Text("Subtitle")
    .dsFont(.titleH3)

// Body text
Text("Regular body text")
    .dsFont(.bodyMRegular)

Text("Bold body text")
    .dsFont(.bodyMBold)

// Small text
Text("Small caption")
    .dsFont(.bodySRegular)
```

Available font styles:
- **Titles**: `titleH0`, `titleH1`, `titleH2`, `titleH3`, `titleH4`
- **Bold Titles**: `titleH0Strong`, `titleH1Strong`, `titleH2Strong`, `titleH3Strong`, `titleH4Strong`
- **Body**: `bodyMRegular`, `bodyMMedium`, `bodyMBold`
- **Small**: `bodySRegular`, `bodySMedium`, `bodySBold`
- **Extra Small**: `bodyXSRegular`, `bodyXSMedium`, `bodyXSBold`

### Spacing

Consistent spacing throughout your app:

```swift
// Using spacing in stacks
VStack(spacing: .m) {
    Text("Item 1")
    Text("Item 2")
}

// Applying padding
Text("Content")
    .dsPadding(.l, edges: .horizontal)
    .dsPadding(.m, edges: .vertical)

// Available spacing values
// .zero, .xxs, .xs, .s, .m, .l, .xl, .xxl, .xxxl, .xxxxl
```

### Corner Radius

Standardized corner radius values:

```swift
Rectangle()
    .dsCornerRadius(.m)

// Available values
// .xxs, .xs, .s, .m, .l, .xl, .xxl, .xxxl, .round
```

### Buttons

DesignSystemKit provides three button styles with different sizes:

```swift
// Primary button
Button("Primary Action") {
    // Action
}
.buttonStyle(.primary)

// Secondary button
Button("Secondary Action") {
    // Action
}
.buttonStyle(.secondary)

// Ghost button
Button("Ghost Action") {
    // Action
}
.buttonStyle(.ghost)

// Custom button with icon
Button("Custom Button") {
    // Action
}
.buttonStyle(.primary(content: .init(icon: Image(systemName: "star"))))
```

### Haptic Feedback

Integrated haptic feedback system:

```swift
import DesignSystemKit

// Using predefined haptic feedback
Button("Tap me") {
    // Your action
}
.hapticFeedback(.impact(weight: .medium))

// Custom haptic feedback
Button("Custom feedback") {
    // Your action
}
.hapticFeedback(.custom(label: "Custom", feedback: {
    // Custom haptic implementation
}))
```

### Toast Notifications

Built-in toast component for user feedback:

```swift
struct ContentView: View {
    @State private var showToast = false
    
    var body: some View {
        VStack {
            Button("Show Toast") {
                showToast = true
            }
        }
        .toast(isPresented: $showToast, message: "This is a toast message")
    }
}
```

### Modifiers

Additional modifiers for enhanced UI:

```swift
// Shadow
Rectangle()
    .dsShadow(.background(.secondary), radius: .s, x: 0, y: 2)

// Scale on tap
Button("Tap me") {
    // Action
}
.dsScaleOnTap()

// Overlay
Rectangle()
    .dsOverlay(alignment: .center) {
        Text("Overlay")
    }

// First appear
Text("Content")
    .dsOnFirstAppear {
        // Code to run on first appearance
    }
```

## Architecture

The library is organized into logical modules:

```
DesignSystemKit/
├── DSColor/           # Color system and modifiers
├── DSFonts/          # Typography system
├── DSButton/         # Button components and styles
├── DSToast/          # Toast notification system
├── DSHapticFeedback/ # Haptic feedback system
├── DSColorView/      # Color display components
├── Spacing+Extensions/ # Spacing utilities
├── CornerRadius+Extensions/ # Corner radius utilities
├── Modifiers/        # Custom view modifiers
└── Resources/        # Color assets and fonts
```

### Key Design Principles

1. **Semantic Naming**: All colors, fonts, and spacing use semantic names
2. **Consistency**: Standardized values across all design tokens
3. **Accessibility**: Built-in support for light/dark mode
4. **Extensibility**: Easy to extend with custom components
5. **Type Safety**: Strongly typed enums prevent invalid values

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Setup

1. Clone the repository
2. Open `Package.swift` in Xcode
4. Make your changes
5. Add tests for new functionality
6. Update documentation

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: This design system is designed to be flexible and extensible. Feel free to customize colors, fonts, and other design tokens to match your brand guidelines while maintaining the consistent structure provided by DesignSystemKit.
