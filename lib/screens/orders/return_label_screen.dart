import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ReturnLabelScreen extends StatelessWidget {
  static const routeName = '/return-label';

  const ReturnLabelScreen({super.key});

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
          'RETURN LABEL',
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
            const SizedBox(height: 32),

            // QR Code Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // QR Placeholder
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      color: const Color(0xFF649588),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDQq-qxUgGBfHbZ-qD7ISdxmXDT5dWt-cFqQfCy5qdKmK0X2nR0nB0C4qGQZYaJXBfP6xMzIJKMBxPQzFwR2qZHCsFnLAQ2sWvJXQWQ6bWMNVnG-T0x2B4R_xXZAeQN8Fxk',
                        fit: BoxFit.contain,
                        errorBuilder: (ctx, err, stack) => const Icon(
                          Icons.qr_code_2,
                          size: 80,
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'RETURN ID',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.mediumGray,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '#RET-9901',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),

                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.file_download_outlined, size: 20),
                    label: const Text(
                      'DOWNLOAD LABEL',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.black,
                      minimumSize: const Size(200, 48),
                      side: const BorderSide(color: AppTheme.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Instructions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HOW TO USE',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildInstructionItem(
                    number: '1',
                    title: 'Pack items securely',
                    subtitle:
                        'Use the original packaging if possible for a safer return.',
                  ),

                  const SizedBox(height: 24),

                  _buildInstructionItem(
                    number: '2',
                    title: 'Show this QR code',
                    subtitle:
                        'Present this screen to the clerk at the drop-off point.',
                  ),

                  const SizedBox(height: 24),

                  _buildInstructionItem(
                    number: '3',
                    title: 'No printing required',
                    subtitle: 'Sustainable and easy—no paper label needed.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
          label: const Text(
            'FIND NEARBY DROP-OFF',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: AppTheme.black,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 4,
            shadowColor: AppTheme.primaryColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionItem({
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: AppTheme.black,
              ),
            ),
          ),
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
                  fontSize: 14,
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
