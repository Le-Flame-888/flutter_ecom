# EFM Flutter Ecommerce

A modern, feature-rich e-commerce application built with Flutter and Firebase. This app provides a seamless shopping experience with user authentication, product browsing, and cart management.

## Features

-   **User Authentication**: Secure Sign Up, Sign In, and Sign Out functionality powered by Firebase Auth.
-   **Social Login UI**: Beautiful UI support for Google, Facebook, and Apple sign-in options.
-   **Product Catalog**: Browse products by category (Dresses, Hoodies, Jackets, etc.) and filter by gender.
-   **Product Details**: Rich product views with images, descriptions, and pricing.
-   **Shopping Cart**: Add items to cart and manage quantities.
-   **Wishlist**: Save favorite items for later.
-   **Profile Management**: View user details and access account settings.
-   **Responsive Design**: Optimized for Android, iOS, and Web.

## Tech Stack

-   **Frontend**: Flutter (Dart)
-   **Backend / Auth**: Firebase Authentication
-   **State Management**: Provider
-   **Assets**: SVG support via `flutter_svg`

## Getting Started

### Prerequisites

-   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
-   A Firebase project created in the [Firebase Console](https://console.firebase.google.com/).

### Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd flutter_ecom
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

### Firebase Configuration

This project relies on Firebase. You **must** provide your own configuration files for the app to run.

#### Android
1.  Go to Project Settings in Firebase Console.
2.  Add an Android app.
3.  Download `google-services.json`.
4.  Place it in `android/app/google-services.json`.

#### iOS
1.  Go to Project Settings in Firebase Console.
2.  Add an iOS app.
3.  Download `GoogleService-Info.plist`.
4.  Place it in `ios/Runner/GoogleService-Info.plist`.

#### Web
1.  Go to Project Settings in Firebase Console.
2.  Add a Web app.
3.  Update `lib/firebase_options.dart` with your specific API keys and App IDs.
    *Note: The project currently includes a `firebase_options.dart` file, but you should update it with your own credentials.*

### Running the App

-   **Run on Android/iOS**:
    ```bash
    flutter run
    ```
-   **Run on Web**:
    ```bash
    flutter run -d chrome
    ```

## Project Structure

```
lib/
├── models/         # Data models (Product, User, etc.)
├── providers/      # State management logic (AuthProvider, CartProvider)
├── screens/        # UI Screens (Home, Login, Profile, etc.)
├── services/       # External services (AuthService)
├── theme/          # App styling and constants
├── widgets/        # Reusable UI components
└── main.dart       # App entry point and routing
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
