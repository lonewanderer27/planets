# Planets

Planets is a Flutter application that provides an interactive 3D view of the planets in our solar system. Users can explore each planet, view detailed descriptions, and navigate between planets.

This app is part of a series where I try to learn Flutter by creating space-themed applications.

## Features

- Interactive 3D models of planets
- Detailed descriptions of each planet
- Smooth navigation between planets
- Dark theme for better visual experience

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio or Xcode for mobile development

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/planets.git
   cd planets
   ```

2. Install dependencies:
    ```flutter pub get```

3. Run the app
    ```flutter run```

### Project Structure
```
.
├── android/                # Android-specific files
├── assets/                 # 3D models and icons
├── ios/                    # iOS-specific files
├── lib/                    # Main application code
│   ├── constants.dart      # Planet descriptions and enums
│   └── main.dart           # Main application entry point
├── test/                   # Unit and widget tests
├── .gitignore              # Git ignore file
├── analysis_options.yaml   # Dart analysis options
├── flutter_launcher_icons.yaml # Flutter launcher icons configuration
├── pubspec.yaml            # Flutter project configuration
└── README.md               # Project README
```

### Usage
- Launch the app on your device or emulator.
- Use the left and right arrows to navigate between planets.
- View the 3D model and read the description of each planet.

### Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
