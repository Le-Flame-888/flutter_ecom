import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class ReferFriendScreen extends StatelessWidget {
  static const routeName = '/refer-friend';

  const ReferFriendScreen({super.key});

  void _copyCode(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: 'STYLE-UX-2024'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Referral code copied!'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Refer a Friend',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Hero Image
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5EDE4),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDPv-qxUgGBfHbZ-qD7ISdxmXDT5dWt-cFqQfCy5qdKmK0X2nR0nB0C4qGQZYaJXBfP6xMzIJKMBxPQzFwR2qZHCsFnLAQ2sWvJXQWQ6bWMNVnG-T0x2B4R_xXZAeQN8Fxk',
                    fit: BoxFit.contain,
                    errorBuilder: (ctx, err, stack) => Center(
                      child: Icon(
                        Icons.people,
                        size: 80,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.black,
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(text: 'Share the Style,\n'),
                    WidgetSpan(
                      child: Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Get \$20',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Description
              Text(
                'Give your friends \$20 off their first order\nand get \$20 in points when they shop.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // Referral Code Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FFF5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.5),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'YOUR REFERRAL CODE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'STYLE-UX-2024',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 160,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () => _copyCode(context),
                        icon: const Icon(Icons.copy, size: 18),
                        label: const Text(
                          'Copy Code',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: AppTheme.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Share via
              Text(
                'OR SHARE VIA',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: AppTheme.mediumGray,
                ),
              ),

              const SizedBox(height: 20),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(Icons.mail_outline, 'Email'),
                  const SizedBox(width: 16),
                  _buildSocialButton(Icons.message_outlined, 'SMS'),
                  const SizedBox(width: 16),
                  _buildSocialButton(Icons.share_outlined, 'More'),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppTheme.black, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: AppTheme.mediumGray)),
      ],
    );
  }
}
