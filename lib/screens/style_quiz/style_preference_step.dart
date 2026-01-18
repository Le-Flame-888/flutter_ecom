import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StylePreferenceStep extends StatefulWidget {
  final VoidCallback onNext;

  const StylePreferenceStep({super.key, required this.onNext});

  @override
  State<StylePreferenceStep> createState() => _StylePreferenceStepState();
}

class _StylePreferenceStepState extends State<StylePreferenceStep> {
  final Set<String> _selectedStyles = {};

  final List<Map<String, String>> _styles = [
    {
      'name': 'Minimalist',
      'desc': 'Clean & Neutral',
      'image': 'assets/images/quiz/minimalist.png',
    },
    {
      'name': 'Streetwear',
      'desc': 'Urban & Edgy',
      'image': 'assets/images/quiz/streetwear.png',
    },
    {
      'name': 'Bohemian',
      'desc': 'Free-spirited',
      'image': 'assets/images/quiz/boho.png',
    },
    {
      'name': 'Formal',
      'desc': 'Polished & Classic',
      'image': 'assets/images/quiz/formal.png',
    },
  ];

  void _toggleSelection(String styleName) {
    setState(() {
      if (_selectedStyles.contains(styleName)) {
        _selectedStyles.remove(styleName);
      } else {
        _selectedStyles.add(styleName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Epilogue',
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: AppTheme.black,
                height: 1.1,
              ),
              children: [
                const TextSpan(text: 'What is your\n'),
                TextSpan(
                  text: 'preferred look?',
                  style: TextStyle(
                    backgroundColor: AppTheme.black,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: _styles.length,
            itemBuilder: (context, index) {
              final style = _styles[index];
              final isSelected = _selectedStyles.contains(style['name']);

              return GestureDetector(
                onTap: () => _toggleSelection(style['name']!),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
                        ? Border.all(color: AppTheme.primaryColor, width: 4)
                        : null,
                    image: DecorationImage(
                      image: const AssetImage(
                        'assets/images/placeholder_outfit.png',
                      ), // Using placeholder for now
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  child: Stack(
                    children: [
                      if (isSelected)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 16,
                              color: AppTheme.black,
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              style['desc']!,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'You can select multiple styles that fit you.',
              style: TextStyle(color: AppTheme.mediumGray, fontSize: 12),
            ),
          ),
        ),

        // Bottom Button
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppTheme.backgroundLight,
                AppTheme.backgroundLight.withOpacity(0.9),
                AppTheme.backgroundLight.withOpacity(0.0),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: _selectedStyles.isNotEmpty ? widget.onNext : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: AppTheme.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              disabledBackgroundColor: AppTheme.lightGray,
              disabledForegroundColor: AppTheme.mediumGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'NEXT STEP',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
