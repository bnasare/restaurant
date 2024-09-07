# Restaurant App

A Flutter application for browsing and searching restaurants. This app utilizes Riverpod for state management and Freezed for immutable data classes.

## Features

- Fetch and display a list of restaurants
- Search for restaurants by name
- Handle loading and error states
- Refresh restaurant data

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository
    ```bash
    git clone https://github.com/bnasare/restaurant-app.git
    ```
2. Navigate to the project directory
    ```bash
    cd restaurant-app
    ```
3. Install dependencies
    ```bash
    flutter pub get
    ```
4. Run the app
    ```bash
    flutter run
    ```

## Project Structure

- `lib/`: Contains the main application code.
- `core/restaurant/`: Core logic for restaurant operations.
- `data/`: Data sources and local database.
- `domain/`: Business logic and use cases.
- `presentation/`: UI and Riverpod providers.
- `shared/`: Shared resources like constants, themes, and utilities.
- `src/home/`: Home screen and related widgets.

## Dependencies

- **Riverpod**: State management
- **Freezed**: Immutable data classes
- **Dartz**: Functional programming utilities

## Key Files

- `lib/injection_container.dart`: Dependency injection setup using GetIt.
- `lib/src/home/presentation/interface/screens/home_screen.dart`: Home screen with search functionality and restaurant listing.
- `lib/core/restaurant/presentation/riverpod/restaurant_provider.dart`: Riverpod providers for managing restaurant state.
- `lib/core/restaurant/presentation/riverpod/restaurant_mixin.dart`: Mixin for restaurant search functionality.

## Contributing

1. Fork the repository
2. Create a new branch
3. Make your changes
4. Commit your changes
5. Push to the branch
6. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
