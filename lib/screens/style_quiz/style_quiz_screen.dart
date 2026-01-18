import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'style_preference_step.dart';
import 'color_palette_step.dart';
import 'quiz_results_screen.dart';

class StyleQuizScreen extends StatefulWidget {
  static const routeName = '/style-quiz';

  const StyleQuizScreen({super.key});

  @override
  State<StyleQuizScreen> createState() => _StyleQuizScreenState();
}

class _StyleQuizScreenState extends State<StyleQuizScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 1;
  final int _totalSteps = 2; // Implemented steps (Preference, Colors)

  void _nextPage() {
    if (_currentStep < _totalSteps) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.of(context).pushReplacementNamed(QuizResultsScreen.routeName);
    }
  }

  void _previousPage() {
    if (_currentStep > 1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep--;
      });
    } else {
      Navigator.of(context).pop();
    }
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppTheme.black,
                    ),
                    onPressed: _previousPage,
                  ),
                  const Text(
                    'DEFINE YOUR STYLE',
                    style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(width: 40), // Spacer
                ],
              ),
            ),

            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ONBOARDING QUIZ',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.black.withOpacity(0.5),
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        'Step $_currentStep of $_totalSteps',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: _currentStep / _totalSteps,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent manual swiping
                children: [
                  StylePreferenceStep(onNext: _nextPage),
                  ColorPaletteStep(onNext: _nextPage, onBack: _previousPage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
