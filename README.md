# Onboarding Dashboard App

A modern Flutter app with onboarding, login, and animated dashboard features.

---

## 🚀 Getting Started

### ✅ Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code with Flutter plugin
- Xcode (for iOS builds on macOS)

---

### 🛠️ Installation & Running

1. Clone the repository:

   ```bash
   git clone https://github.com/hassanali2596/onboarding_dashboard_app.git
   cd onboarding_dashboard_app
    ```

2. Install dependencies:

   ```bash
   flutter pub get
    ```
   
3. Run the app:

   ```bash
    flutter run
    ```
4. Run tests: 

   ```bash
   flutter test
   ```


🧠 Project Architecture
This project uses a feature-first clean architecture, designed to be scalable and maintainable.

📁 Folder Structure 
```bash
lib/
├── core/                # Global/shared resources
│   ├── constants/       # App-wide constants (e.g., asset paths)
│   ├── enums/           # Enums like BlocStatus
│   ├── theme/           # Light and Dark mode theme definitions
│   ├── utils/           # Reusable utilities
│   └── widgets/         # Shared UI components
│
├── features/            # Organized by feature
│   ├── dashboard/       # Dashboard module
│   │   ├── data/        # Models or API/data source (if any)
│   │   ├── logic/       # Cubit/BLoC and business logic
│   │   └── ui/          # Screens and widgets
│   ├── login/           # Login screen logic
│   ├── onboarding/      # Onboarding screen logic
│   └── splash/          # Splash screen
│
└── main.dart            # App entry point
```

📦 State Management
Built using flutter_bloc

Each feature module contains its own Cubit inside features/<feature>/logic/

Ensures testability and separation of concerns

🎨 Theming
App supports both light and dark themes, defined in core/theme/

   
