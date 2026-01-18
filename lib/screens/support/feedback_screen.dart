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
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppTheme.whiteColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: AppTheme.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Rate Your Experience',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.black,
              ),
            ),
            const SizedBox(height: 48),

            // Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  iconSize: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  icon: Icon(
                    Icons.star,
                    color: index < _rating
                        ? AppTheme.primaryColor
                        : AppTheme.lightGray,
                  ),
                );
              }),
            ),
            const SizedBox(height: 48),

            // Text Input
            Container(
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                boxShadow: AppTheme.shadowSm,
              ),
              child: TextField(
                controller: _feedbackController,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Share your thoughts about our service (optional)',
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Chips
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChip('Fast Response', true),
                const SizedBox(width: 12),
                _buildChip('Very Helpful', false),
              ],
            ),

            const SizedBox(height: 48),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Go back to Home/Profile
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Thank you for your feedback!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: AppTheme.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  ),
                  shadowColor: AppTheme.primaryColor.withOpacity(0.4),
                  elevation: 8,
                ),
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: isSelected ? null : Border.all(color: AppTheme.lightGray),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isSelected ? AppTheme.black : AppTheme.mediumGray,
        ),
      ),
    );
  }
}
