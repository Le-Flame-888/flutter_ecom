import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = '/feedback';

  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _rating = 4;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: AppTheme.black, size: 20),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'RATE YOUR EXPERIENCE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: AppTheme.black,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your feedback helps us improve the Stitch shopping experience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 48),

            // Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () => setState(() => _rating = index + 1),
                  iconSize: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: index < _rating
                        ? AppTheme.primaryColor
                        : const Color(0xFFE0E0E0),
                  ),
                );
              }),
            ),
            const SizedBox(height: 56),

            // Text Input
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                controller: _feedbackController,
                maxLines: 6,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'SHARE YOUR THOUGHTS...',
                  hintStyle: TextStyle(
                    letterSpacing: 1,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFBDBDBD),
                  ),
                  contentPadding: EdgeInsets.all(28),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Chips
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildChip('FAST RESPONSE', true),
                _buildChip('HELPFUL', false),
              ],
            ),

            const SizedBox(height: 64),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'THANK YOU FOR YOUR FEEDBACK!',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: AppTheme.black,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: AppTheme.black,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SUBMIT FEEDBACK',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? AppTheme.black : const Color(0xFFF3F3F3),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 10,
          letterSpacing: 0.5,
          color: isSelected ? Colors.white : AppTheme.black,
        ),
      ),
    );
  }
}
