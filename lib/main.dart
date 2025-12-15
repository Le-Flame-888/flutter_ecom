import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => CartProvider())],
      child: MaterialApp(
        title: 'EFM Flutter Ecommerce',
        theme: AppTheme.lightTheme,
        home: AuthScreen(),
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          MainScreen.routeName: (ctx) => const MainScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          // ProductListScreen.routeName: (ctx) => ProductListScreen(), // Deprecated
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          ConfirmationScreen.routeName: (ctx) => const ConfirmationScreen(),
        },
      ),
    );
  }
}
