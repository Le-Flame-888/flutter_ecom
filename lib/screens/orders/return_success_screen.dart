import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../main_screen.dart';
import 'return_label_screen.dart';

class ReturnSuccessScreen extends StatelessWidget {
  static const routeName = '/return-success';

  const ReturnSuccessScreen({super.key});

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
            icon: const Icon(Icons.close, color: AppTheme.black),
            onPressed: () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false),
          ),
        ],
        title: const Text(
          'RETURN CONFIRMATION',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Success Icon
            Center(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 60,
                      color: AppTheme.black,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primaryColor,
                        width: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Return Request\nSubmitted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppTheme.black,
                height: 1.1,
              ),
            ),

            const SizedBox(height: 16),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 15,
                  height: 1.5,
                ),
                children: const [
                  TextSpan(text: 'Your return request '),
                  TextSpan(
                    text: '#RET-9901',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' has been received. You will receive an email with your return label and instructions shortly.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // Next Steps Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FFF5),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NEXT STEPS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.mediumGray,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildNextStep(
                    icon: Icons.inventory_2_outlined,
                    title: 'Pack items',
                    subtitle:
                        'Place items in their original packaging if possible',
                    isLast: false,
                  ),

                  _buildNextStep(
                    icon: Icons.print_outlined,
                    title: 'Print label',
                    subtitle:
                        'Wait for our email and print the attached shipping label',
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ReturnLabelScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: AppTheme.black,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Track Return Status',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                side: const BorderSide(color: Color(0xFFEEEEEE), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextStep({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF3F3F3)),
              ),
              child: Icon(icon, color: AppTheme.black, size: 20),
            ),
            if (!isLast)
              Container(width: 2, height: 40, color: const Color(0xFFF3F3F3)),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
