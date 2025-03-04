![Static Badge](https://img.shields.io/badge/flutter__rainbow__border-v0.0.2-8a2b)
![Static Badge](https://img.shields.io/badge/platform-flutter-ff69b4.svg) 
![Static Badge](https://img.shields.io/badge/license-MIT-purple)

## Features

This package allows you to create a rotating rainbow border. For more information, see the documentation below.

## Getting started

Install the package using the following command:
```bash
flutter pub add flutter_rainbow_border
```
Import the package in your dart file using the following code:
```dart
import 'package:flutter_rainbow_border/flutter_rainbow_border.dart';
```

## Usage

```dart
RainbowBorder(
    width: 300,
    height: 300,
    border: 4,
    borderRadius: 10,
),
```

<img width="200" alt="screenshot_2025-03-04" src="https://github.com/user-attachments/assets/d0034af4-b605-46f2-a277-5a764788b51e" />

## Available Properties

| Property           | Type     | Description                                              |
|--------------------|----------|----------------------------------------------------------|
| `width`            | double   | Container width                                          |
| `height`           | double   | Container height                                         |
| `border`           | double   | Border thickness                                         |
| `borderRadius`     | double   | Border corner radius                                     |
| `isRotating`       | bool     | Enables rotation                                         |
| `fixedRotation`    | double   | Fixed rotation angle (range: 0~360 degrees)              |
| `isClockwise`      | bool     | Rotation direction (default: true)                       |
| `rotationDuration` | Duration | Determine the rotation speed (default: 3 seconds)        |
| `backgroundColor`  | Color    | Background color (default: transparent)                  |
| `child`            | Widget   | Child widget inside                                      |

## Author

This package is developed by Jungi Kim.

- [GitHub][github]

[github]: https://github.com/Vulpes94