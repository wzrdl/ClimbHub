# ClimbHub (攀点)

A modern iOS app for climbers to discover climbing gyms and learn routes through video sharing.

## Features

- User authentication and profile management
- Climbing gym discovery with location-based search
- Route video sharing and viewing
- Grade-based video filtering
- Personal climbing profile with physical attributes

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Clone the repository
2. Open `ClimbHub.xcodeproj` in Xcode
3. Build and run the project

## Architecture

The app follows MVVM (Model-View-ViewModel) architecture pattern and uses SwiftUI for the UI layer.

## Project Structure

```
ClimbHub/
├── App/
│   └── ClimbHubApp.swift
├── Features/
│   ├── Authentication/
│   ├── Profile/
│   ├── GymDiscovery/
│   └── VideoSharing/
├── Core/
│   ├── Models/
│   ├── Services/
│   └── Utils/
└── Resources/
    ├── Assets.xcassets
    └── Info.plist
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.