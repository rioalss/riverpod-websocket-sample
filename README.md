# Riverpod WebSocket Sample (Coinbase Tracker)

A real-time cryptocurrency price tracker built with Flutter, utilizing the Coinbase WebSocket API. This project demonstrates a clean architecture approach with manual dependency injection using Riverpod.

## 🚀 Features

- **Real-time Price Tracking**: Live updates for XRP-USD (and other products) via WebSocket.
- **Product Status Monitoring**: View the status and details of various trading pairs.
- **Robust WebSocket Service**: Includes automatic reconnection logic, error handling, and status tracking.
- **Clean Architecture**: Clear separation of concerns between data, domain, and presentation layers.
- **Manual Dependency Injection**: Leveraging Riverpod's `Provider` and `Ref` for flexible and testable DI.

## 🛠 Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev/) (StateNotifier, Provider, Provider.family)
- **Data Modeling**: [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable)
- **Functional Programming**: [Dartz](https://pub.dev/packages/dartz) (using `Either` for error handling)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Networking**: [web_socket_channel](https://pub.dev/packages/web_socket_channel)
- **Environment Config**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

## 📁 Project Structure

```text
lib/
├── app/          # App-wide configuration (theme, router)
├── core/         # Infrastructure and shared utilities
│   ├── config/   # App constants and environment config
│   ├── di/       # Dependency injection setup (Riverpod)
│   ├── error/    # Custom exceptions and failures
│   └── service/  # Network services (WebSocket)
├── data/         # Data layer implementation
│   ├── datasources/ # Remote data sources (WebSocket)
│   ├── mapper/      # Model to Entity mappers
│   ├── models/      # Data transfer objects (Freezed)
│   └── repositories/# Repository implementations
├── domain/       # Business logic layer
│   ├── entities/ # Plain data classes
│   ├── repositories/# Repository interfaces
│   └── usecase/  # Business logic actions
└── features/     # Feature-specific UI and state management
    └── feature 1/
        ├── providers/ # Notifiers and providers
        ├── screen/    # Feature screens
        ├── state/     # UI state models
        └── widgets/   # Feature widgets
```

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK (>= 3.2.6)
- Dart SDK

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-repo/riverpod-websocket-sample.git
   cd riverpod-websocket-sample
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**:
   Copy the example environment file and customize it.

   ```bash
   cp .env.example .env.dev
   ```

4. **Run code generation**:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## 🏃 Running the App

Run the app in your desired environment:

- **Development**: `flutter run --target lib/main_development.dart`
- **Staging**: `flutter run --target lib/main_stagging.dart`
- **Production**: `flutter run --target lib/main_production.dart`

## 🧪 Testing

Run automated tests:

```bash
flutter test
```

---
> [!NOTE]
> This project was recently migrated from `get_it` and `injectable` to a pure Riverpod-based dependency injection pattern for better integration with the Flutter lifecycle.
