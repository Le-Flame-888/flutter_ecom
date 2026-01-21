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
# Stitch Fashion - Application E-commerce Flutter

![Banner](assets/images/quiz/style_quiz_intro.png) <!-- Optionnel: mettre un lien vers une image réelle si disponible -->

## 📌 Présentation du Projet
**Stitch Fashion** est une application mobile e-commerce moderne développée avec **Flutter**. Elle offre une expérience d'achat fluide et personnalisée, incluant des fonctionnalités avancées comme un quiz de style pour recommander des produits adaptés aux goûts de l'utilisateur.

L'objectif de ce projet est de démontrer une architecture robuste, une gestion d'état efficace et une intégration complète avec Firebase pour l'authentification et les données.

---

## 🚀 Fonctionnalités Clés
- **Authentification complète** : Connexion, inscription et récupération de mot de passe via Firebase Auth.
- **Catalogue de Produits** : Navigation par catégories (Robes, Hoodies, Vestes, etc.) avec filtrage.
- **Quiz de Style** : Un parcours interactif pour définir le profil mode de l'utilisateur.
- **Gestion du Panier** : Ajout/suppression d'articles, gestion des quantités et calcul du total en temps réel.
- **Système de Fidélité** : Programme de parrainage et points de fidélité.
- **Localisateur de Magasins** : Intégration de cartes pour trouver les points de vente physiques.
- **Design Premium** : Interface utilisateur soignée avec des polices Google Fonts et des composants personnalisés.

---

## 🛠 Technologies Utilisées
- **Framework** : [Flutter](https://flutter.dev) (Dart)
- **Gestion d'État** : [Provider](https://pub.dev/packages/provider)
- **Backend** : [Firebase](https://firebase.google.com/) (Auth, Firestore)
- **UI/UX** :
    - `google_fonts` pour la typographie.
    - `flutter_svg` pour les icônes vectorielles.
    - `flutter_staggered_grid_view` pour des mises en page dynamiques.
- **Internationalisation** : `intl` pour le formatage des dates et devises.

---

## 📂 Structure du Projet
L'organisation du code suit les meilleures pratiques Flutter pour assurer la maintenabilité :

```text
lib/
├── models/         # Définition des objets de données (Product, CartItem, Order)
├── providers/      # Logique métier et gestion d'état (Auth, Cart, Product)
├── screens/        # Écrans de l'application (Home, Catalog, Quiz, Auth)
├── services/       # Services externes (Firebase, API)
├── theme/          # Configuration du thème global (Couleurs, Typo)
├── widgets/        # Composants UI réutilisables
└── main.dart       # Point d'entrée de l'application
```

---

## 💻 Détails de l'Architecture

### 1. Modèles de Données (`lib/models/`)
Les modèles sont des classes Dart simples qui représentent les entités du domaine. Par exemple, le modèle `Product` contient les attributs comme le nom, le prix, la catégorie et l'image.

### 2. Providers (`lib/providers/`)
Nous utilisons le pattern **Provider** pour séparer la logique de l'UI.
- **Auth Provider** : Gère l'état de connexion de l'utilisateur.
- **Product Provider** : Gère la liste des produits et les filtres.
- **Cart Provider** : Gère les articles ajoutés au panier et les calculs associés.

### 3. Screens & Widgets (`lib/screens/` & `lib/widgets/`)
L'interface est décomposée en widgets réutilisables. Les écrans sont des compositions de ces widgets, réagissant aux changements d'état fournis par les Providers.

---

## 📦 Installation
Pour lancer le projet localement :

1.  **Cloner le dépôt** :
    ```bash
    git clone https://github.com/votre-repo/flutter_ecom.git
    ```
2.  **Installer les dépendances** :
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
