import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ColorPaletteStep extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const ColorPaletteStep({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<ColorPaletteStep> createState() => _ColorPaletteStepState();
}

class _ColorPaletteStepState extends State<ColorPaletteStep> {
  final Set<String> _selectedColors = {};

  final List<Map<String, dynamic>> _colors = [
    {
      'name': 'Neutral',
      'bg': Color(0xFFE5DACE),
      'gradient': [Color(0xFFD2B48C), Color(0xFFBC8F8F)],
      'textColor': Color(0xFF44403C),
    },
    {
      'name': 'Vibrant',
      'bg': Color(0xFFFFEDF1),
      'gradient': [Color(0xFFFF4500), Color(0xFFFF1493)],
      'textColor': Color(0xFF9F1239),
    },
    {
      'name': 'Pastels',
      'bg': Color(0xFFF3E8FF),
      'gradient': [Color(0xFFE0BBE4), Color(0xFFD291BC)],
      'textColor': Color(0xFF6B21A8),
    },
    {
      'name': 'Monochrome',
      'bg': Color(0xFFF1F1F1),
      'gradient': [Colors.black, Colors.white],
      'textColor': Color(0xFF18181B),
    },
  ];

  void _toggleSelection(String colorName) {
    setState(() {
      if (_selectedColors.contains(colorName)) {
        _selectedColors.remove(colorName);
      } else {
        _selectedColors.add(colorName);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Which colors do you wear most?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Epilogue',
                  fontSize: 28,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This helps us curate your daily recommendations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.black.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.0,
            ),
            itemCount: _colors.length,
            itemBuilder: (context, index) {
              final color = _colors[index];
              final isSelected = _selectedColors.contains(color['name']);

              return GestureDetector(
                onTap: () => _toggleSelection(color['name']),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: color['bg'],
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppTheme.primaryColor, width: 4)
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.4),
                              blurRadius: 10,
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: color['gradient'],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        color['name'],
                        style: TextStyle(
                          color: color['textColor'],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Bottom Buttons
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _selectedColors.isNotEmpty ? widget.onNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: AppTheme.black,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  disabledBackgroundColor: AppTheme.lightGray,
                  disabledForegroundColor: AppTheme.mediumGray,
                ),
                child: const Text(
                  'NEXT STEP',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: widget.onBack,
                child: Text(
                  'BACK',
                  style: TextStyle(
                    color: AppTheme.black.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
