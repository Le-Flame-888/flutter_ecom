import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _steps = [
    {
      'title': 'Discover the\nLatest Trends',
      'description':
          'Explore a curated collection of modern fashion tailored specifically for your unique personal style.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCRM7BUXFW7qJLMZqTma3mTdRabGeYIvhTQoRSxQBnoOqWPf-010zrhfOeFQrdlZAZ5M8qZ5LmFbrdle5R7pOEJjipB3rr8-RcxdXmtc2Q6GLoAXOxkFVhYN81_dRIaTjhsGjbvdSI8XnxNtgOzX1YRNebrthuuxFmC0R6MowWIjShAmsmlquX8OuR6JZNV8Lu7_eKyVO0bO4nKVAwi83JrkQaDSsOZiP7avpJXcKa5HonmE7nCzmTulrq3KNccxGQIHDPKqj5c8bTu',
    },
    {
      'title': 'Seamless Shopping Experience',
      'description':
          'Add items to your cart and checkout in just a few taps with our secure system.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAeNBf5rwawToBjwDip9OQKBpPOlVwHTBDNTH0isAn7Gy1I-Xy-vP_pt27YnovrzlanouXyRCggKYuWm1DOeHk8cVR-_bdfUryyPv1Oeo5Vn0q-WuDrBHYoImXWGO0K6LvOutyZnhIA7akRh7LMdPOtImfsMQmh7UkwnQLhP_C2tiu7Wvs79dVijtn3tvLfQaJ130CL3Xp3GPpYKLP5KItykqGsubhlzVn5C6iEFd0nDatmp_VzwXQggbmZsgYAClnFEwCWSzuUQFn9',
    },
    {
      'title': 'Fast & Secure\nDelivery',
      'description':
          'Get your fashion favorites delivered right to your doorstep with real-time tracking.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCQCyiz1z5vwIPfS6rKoSyhG6_3zJsBDMlxUZXmxVijGH9p_GdQtgrS14-5CXUF8hwVvXwvIGnMA_EqpJqQp-koJzJVSGdHiXiEK3saPhI-karPOBXcYC7zene__-EFU7rh0JA6_tIHBVKjJplAO_LeoyomYcXHDv014fFWM4pJ5wjhQIOhlwbT1rfrD5xJSaXxEQD_qoq5b6UifZRSOY_dk8-gAAqVsi7QyHz3GMme4eis9G2TRXnHeoGcXkp4nD70DK-fXtskR9cu',
    },
  ];

  void _nextPage() {
    if (_currentIndex < _steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _finishOnboarding,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppTheme.mediumGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  final step = _steps[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusXLarge,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(step['image']!),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: AppTheme.shadowMd,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Text
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                step['title']!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.black,
                                      height: 1.1,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                step['description']!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: AppTheme.mediumGray,
                                      height: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Actions
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  // Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _steps.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: _currentIndex == index ? 24 : 6,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? AppTheme.primaryColor
                              : AppTheme.lightGray,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.black,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusMedium,
                          ),
                        ),
                        elevation: 5,
                        shadowColor: AppTheme.primaryColor.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentIndex == _steps.length - 1
                                ? 'Get Started'
                                : 'NEXT',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
