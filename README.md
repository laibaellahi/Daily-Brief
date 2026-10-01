# Responsive Flutter News Platform ("Daily Brief")

Phase 1 - Flutter Foundations and UI Mastery.

## Features
- GoRouter, 4 routes: `/`, `/categories`, `/settings`, `/article/:id`
- Material Design 3 theme generated from one brand color (light + dark)
- Adaptive layouts: 1 column (phone) -> 2 (tablet) -> 3 (web); bottom bar -> rail -> extended rail
- Hero image transition from card to detail
- Theme toggle persisted with shared_preferences

## Run (VS Code)
1. Open this folder in VS Code (File > Open Folder).
2. In the terminal, generate the platform folders ONCE (keeps lib/ and pubspec.yaml):
   `flutter create --platforms=android,ios,web .`
3. `flutter pub get`
4. Run: `flutter run -d chrome` (web) or pick an emulator / device.
5. For release Android builds add to android/app/src/main/AndroidManifest.xml:
   `<uses-permission android:name="android.permission.INTERNET"/>`

Images load from picsum.photos (internet needed; offline shows a placeholder icon).
# Daily-Brief
