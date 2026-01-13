# Flutter Portfolio Website

A modern portfolio website built with Flutter Web, inspired by [anubhav055.github.io](https://anubhav055.github.io/).

## Setup Instructions

Since the project files were generated manually, you need to initialize the Flutter platform scaffolding (web, android, ios, etc.).

1.  **Initialize Flutter Project**:
    Run the following command in the project root:
    ```bash
    flutter create . --platforms=web
    ```
    This will generate the `web/` directory and other platform-specific files without overwriting the existing `lib/` code.

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the App**:
    ```bash
    flutter run -d chrome
    ```

## Project Structure
```text
lib/
 ├── main.dart           # App Entry & Theme
 ├── utils/
 │    └── constants.dart # Colors & Constants
 ├── pages/
 │    ├── home.dart      # Hero Section
 │    ├── about.dart     # About, Skills & Experience
 │    ├── projects.dart  # Projects Grid
 │    └── contact.dart   # Contact Form
 ├── widgets/
 │    ├── navbar.dart    # Responsive Navigation
 │    └── footer.dart    # Footer
```

## Features
- **Responsive Design**: Works on Desktop and Mobile.
- **Dark Mode**: Deep blue/black aesthetic.
- **Glassmorphism**: Subtle transparency effects.
- **Smooth Scroll**: Navigation links scroll to sections.
