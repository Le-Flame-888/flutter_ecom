import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../main_screen.dart';

class QuizResultsScreen extends StatelessWidget {
  static const routeName = '/quiz-results';

  const QuizResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'QUIZ RESULTS',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppTheme.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Epilogue',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.black,
                        height: 1.1,
                      ),
                      children: [
                        const TextSpan(text: 'Your Style Profile\n'),
                        TextSpan(
                          text: 'is Ready!',
                          style: TextStyle(color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Based on your preferences',
                    style: TextStyle(
                      color: AppTheme.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Result Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: AppTheme.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/quiz/result_outfit.png',
                            ), // Placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text(
                            '95% Match',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppTheme.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'YOUR IDENTITY',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Urban Minimalist',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Clean lines, neutral palettes, and effortless sophistication. You prioritize quality over quantity and love a versatile wardrobe that transitions from day to night.',
                          style: TextStyle(
                            height: 1.5,
                            color: AppTheme.black.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.verified,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Verified Aesthetic',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Carousel Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Curated For You',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.black,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // Carousel (Mock)
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildShopItem(
                    context,
                    'Oversized Denim Jacket',
                    '\$129',
                    'assets/images/products/jackets/jacket_1.jpg',
                  ),
                  _buildShopItem(
                    context,
                    'Neon Mesh Tee',
                    '\$45',
                    'assets/images/products/dresses/dress_1.jpg',
                  ),
                  _buildShopItem(
                    context,
                    'Vibe Sneakers',
                    '\$190',
                    'assets/images/products/jackets/jacket_2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainScreen.routeName,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: AppTheme.black,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Start Shopping',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pop(); // Simple pop for now, ideally reset quiz
              },
              child: Text(
                'Retake Quiz',
                style: TextStyle(
                  color: AppTheme.mediumGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopItem(
    BuildContext context,
    String title,
    String price,
    String imgPath,
  ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            style: const TextStyle(color: AppTheme.mediumGray, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
