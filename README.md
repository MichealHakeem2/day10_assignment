# Contact App 📞

A clean, modern Flutter Contact application built as part of the EraaSoft Flutter Course (Day 10 Assignment). This project features real-time contact management (CRUD), search filtering, and cloud persistence powered by Firebase Cloud Firestore.

## 📱 App Screenshots

| Home Screen | Add Contact | Edit Contact | Edited Contact |
|:---:|:---:|:---:|:---:|
| ![Home Screen](assets/screenshots/Screenshot%202026-10-03%20073253.png) | ![Add Contact](assets/screenshots/Screenshot%202026-10-03%20073346.png) | ![Edit Contact](assets/screenshots/Screenshot%202026-10-03%20073326.png) | ![Edited Contact](assets/screenshots/Screenshot%202026-10-03%20073336.png)

## ✨ Features

- **Contact Management (CRUD)**: Add, view, edit, and delete contacts stored securely in Firebase Cloud Firestore.
- **Dedicated Form Screen**: Separate screen for adding and editing contacts with automatic input field autofocus.
- **Real-Time Search**: Filter your contact list instantly by name or phone number.
- **Cloud Persistence**: Real-time data sync with Firebase Cloud Firestore.

## 📁 Project Structure

```
lib/
├── core/
│   ├── app_dialog.dart
│   └── app_routes.dart
├── features/
│   ├── models/
│   │   └── contact_model.dart
│   └── view/
│       ├── screens/
│       │   ├── add_contact_screen.dart
│       │   └── home_screen.dart
│       └── widgets/
│           └── contact_card.dart
├── firebase_options.dart
└── main.dart
```

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.13 or newer)
- Android Studio / VS Code
- Firebase Account & Project Configured

### Installation
1. **Clone the repository**:
   ```bash
   git clone git@github.com:MichealHakeem2/day10_assignment.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd day10
   ```
3. **Get dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the application**:
   ```bash
   flutter run
   ```

## 🛠️ Tech Stack & Packages

- **Framework**: Flutter
- **Language**: Dart
- **Backend & Cloud Database**: [Firebase Core](https://pub.dev/packages/firebase_core) & [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
- **Icons**: [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
