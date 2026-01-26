# Flutter Riverpod Real-Time Sample

A comprehensive real-time Flutter application demonstrating clean architecture and diverse real-time communication patterns. This project showcases integration with multiple WebSocket-based services including Coinbase for crypto tracking, Centrifuge for chat, and custom location tracking for delivery services.

## 🚀 Features

- **Real-time Price Tracking (Coinbase)**: Live updates for trading pairs (e.g., XRP-USD) via standard WebSockets.
- **Secure Chat System (Centrifuge)**: Real-time messaging using the Centrifuge protocol with JWT authentication.
- **Customer-Driver Tracking**: Live location monitoring on Google Maps, featuring:
  - Real-time driver position updates.
  - Path rendering with polylines.
  - Distance-based arrival detection.
- **Robust WebSocket Management**: Centralized service handles automatic reconnection, error handling, and connectivity status.
- **Clean Architecture**: Strict separation of concerns (Data, Domain, Presentation).
- **Riverpod State Management**: Modern state handling using `riverpod_generator`, Notifiers, and Providers.

## 🛠 Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev/) (Notifiers, Generators)
- **Real-time Protocols**:
  - [Centrifuge](https://pub.dev/packages/centrifuge) (Chat & Real-time updates)
  - [web_socket_channel](https://pub.dev/packages/web_socket_channel) (Coinbase Feed)
- **Data Modeling**: [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable)
- **Mapping & Location**:
  - [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
  - [geolocator](https://pub.dev/packages/geolocator)
  - [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Functional Programming**: [Dartz](https://pub.dev/packages/dartz) (Either for Error Handling)
- **Environment Config**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

## 📁 Project Structure

```text
lib/
├── app/          # Global config, router, and app entry
├── core/         # Infrastructure & Shared Services
│   ├── service/  # Socket (Centrifuge, WebSockets), Storage, Network
│   ├── di/       # Provider-based Dependency Injection
│   ├── config/   # Env constants
│   └── utils/    # GPS, Formatting, etc.
├── data/         # Data Layer (Implements Repositories)
│   ├── datasources/ # API, Socket Clients
│   ├── models/      # DTOs (Freezed)
│   └── repositories/# Repository Impls
├── domain/       # Business Logic Layer (Pure Dart)
│   ├── entities/    # Domain Objects
│   ├── repositories/# Interfaces
│   └── usecase/     # Direct actions
├── features/     # Feature-oriented UI & Logic
│   ├── chat/        # Messaging implementation
│   ├── coinbase/    # Crypto price tracker
│   └── customer-driver/ # Location tracking & Maps
└── shared/       # Reusable Widgets & Assets
```

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK (>= 3.2.6)
- Google Maps API Key (configured in `AndroidManifest.xml` and `AppDelegate.swift`)

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

3. **Environment Setup**:
   Create `.env.dev` from the example:

   ```bash
   cp .env.example .env.dev
   ```

4. **Code Generation**:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## 🏃 Running the App

Run using different targets:

- **Development**: `flutter run --target lib/main_development.dart`
- **Staging**: `flutter run --target lib/main_stagging.dart`
- **Production**: `flutter run --target lib/main_production.dart`

---
> [!NOTE]
> This project follows a "Riverpod-first" architecture, eliminating the need for `get_it`. Every service and repository is managed via Providers for better testability and Flutter lifecycle awareness.
