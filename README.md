Remote Config Demo (Flutter + Firebase Remote Config)
This Flutter app demonstrates how to integrate Firebase Remote Config using Clean Architecture and BLoC pattern.
It uses GetIt for dependency injection and follows best practices for production-level Flutter apps.

✨ Features
    - Fetch dynamic values from Firebase Remote Config
    - Clean Architecture (Data → Domain → Presentation)
    - BLoC for state management
    - Dependency Injection using GetIt
    - Firebase initialization handled properly
    - Safe error handling and fetch settings

📂 Project Structure

                        lib/
                        │
                        ├── core/
                        │    └── di/           # Dependency Injection (GetIt setup)
                        │
                        ├── data/
                        │    └── data/         # Data sources (Firebase SDK usage)
                        │    └── repository/   # Repository implementations
                        │
                        ├── domain/
                        │    └── repository/   # Repository interfaces
                        │    └── usecase/      # Business logic
                        │
                        ├── presentation/
                        │    └── app.dart      # Main App UI
                        │    └── bloc/         # BLoC files
                        │
                        ├── main.dart          # App entry point
                        
🛠️ Setup Instructions

Clone this repo:

                        git clone https://github.com/your-username/remote_config_demo.git

                        cd remote_config_demo

Install Flutter packages:

                        flutter pub get

                        Setup Firebase:


Make sure Remote Config is enabled in Firebase Console.

Run the app:

                        flutter run
                        
🔥 Important Notes

    - WidgetsFlutterBinding.ensureInitialized() is called before Firebase initialization.
    - Fetch interval is set to 0 seconds during development for easier testing.
    - Proper error handling is implemented to prevent app crashes if fetch fails.
    - Remote Config keys must exist in Firebase console or defaults will be used.


📦 Dependencies Used

                        firebase_core

                        firebase_remote_config

                        flutter_bloc

                        get_it

👨‍💻 Author

Harshvardhan

🚀 Happy Codinggggg!
