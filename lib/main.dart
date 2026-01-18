import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/order_provider.dart';
import 'screens/auth_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/main_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/support/help_center_screen.dart';
import 'screens/support/live_chat_screen.dart';
import 'screens/support/feedback_screen.dart';
import 'screens/orders/order_history_screen.dart';
import 'screens/orders/order_tracking_screen.dart';
import 'screens/orders/select_return_order_screen.dart';
import 'screens/orders/return_reason_screen.dart';
import 'screens/orders/return_method_screen.dart';
import 'screens/orders/return_confirm_screen.dart';
import 'screens/orders/return_success_screen.dart';
import 'screens/orders/return_label_screen.dart';
import 'screens/style_quiz/style_quiz_screen.dart';
import 'screens/style_quiz/quiz_results_screen.dart';
import 'screens/loyalty_screen.dart';
import 'screens/store_locator/store_locator_screen.dart';
import 'screens/store_locator/store_detail_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/refer_friend_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SetupApp());
}

class SetupApp extends StatefulWidget {
  const SetupApp({super.key});

  @override
  State<SetupApp> createState() => _SetupAppState();
}

class _SetupAppState extends State<SetupApp> {
  bool _initialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  Future<void> _initFirebase() async {
    try {
      if (kIsWeb) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } else {
        await Firebase.initializeApp();
      }

      if (mounted) {
        setState(() {
          _initialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Firebase Initialization Error',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(_error!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  const Text(
                    'Note: If running on Web, you need to configure Firebase Options.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (!_initialized) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'EFM Flutter Ecommerce',
          theme: AppTheme.lightTheme,
          home: auth.user != null
              ? const MainScreen()
              : const OnboardingScreen(),
          routes: {
            OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
            AuthScreen.routeName: (ctx) => const AuthScreen(),
            SignupScreen.routeName: (ctx) => const SignupScreen(),
            ForgotPasswordScreen.routeName: (ctx) =>
                const ForgotPasswordScreen(),
            MainScreen.routeName: (ctx) => const MainScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            CheckoutScreen.routeName: (ctx) => const CheckoutScreen(),
            ConfirmationScreen.routeName: (ctx) => const ConfirmationScreen(),
            HelpCenterScreen.routeName: (ctx) => const HelpCenterScreen(),
            LiveChatScreen.routeName: (ctx) => const LiveChatScreen(),
            FeedbackScreen.routeName: (ctx) => const FeedbackScreen(),
            OrderHistoryScreen.routeName: (ctx) => const OrderHistoryScreen(),
            OrderTrackingScreen.routeName: (ctx) => const OrderTrackingScreen(),
            SelectReturnOrderScreen.routeName: (ctx) =>
                const SelectReturnOrderScreen(), // Ensure this is here too if missing
            StyleQuizScreen.routeName: (ctx) => const StyleQuizScreen(),
            QuizResultsScreen.routeName: (ctx) => const QuizResultsScreen(),
            LoyaltyScreen.routeName: (ctx) => const LoyaltyScreen(),
            StoreLocatorScreen.routeName: (ctx) => const StoreLocatorScreen(),
            StoreDetailScreen.routeName: (ctx) => const StoreDetailScreen(),
            SettingsScreen.routeName: (ctx) => const SettingsScreen(),
            ReferFriendScreen.routeName: (ctx) => const ReferFriendScreen(),
            ReturnReasonScreen.routeName: (ctx) => const ReturnReasonScreen(),
            ReturnMethodScreen.routeName: (ctx) => const ReturnMethodScreen(),
            ReturnConfirmScreen.routeName: (ctx) => const ReturnConfirmScreen(),
            ReturnSuccessScreen.routeName: (ctx) => const ReturnSuccessScreen(),
            ReturnLabelScreen.routeName: (ctx) => const ReturnLabelScreen(),
          },
        ),
      ),
    );
  }
}
