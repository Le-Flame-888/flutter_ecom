import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'return_reason_screen.dart';
import 'return_success_screen.dart';

class ReturnConfirmScreen extends StatelessWidget {
  static const routeName = '/return-confirm';

  const ReturnConfirmScreen({super.key});

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
          'Confirm Return',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Step Indicator
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: ReturnStepIndicator(currentStep: 3),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFF3F3F3)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/products/hoodies/hoodie_1.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Classic Oversized Tee',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Size: M | Color: Off-white',
                                style: TextStyle(
                                  color: Color(0xFF4CAF50),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '\$45.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Return Details Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFF3F3F3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RETURN DETAILS',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4CAF50),
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Reason
                        _buildDetailRow(
                          label: 'REASON',
                          value: 'Too small',
                          icon: Icons.info_outline,
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(color: Color(0xFFF3F3F3), height: 1),
                        ),

                        // Method & Address
                        _buildDetailRow(
                          label: 'METHOD & ADDRESS',
                          value:
                              'Courier Pickup\n123 Fashion Ave, Suite 402\nNew York, NY 10001',
                          iconWidget: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FFF5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.local_shipping,
                              color: Color(0xFF4CAF50),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Refund Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ESTIMATED REFUND',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '\$45.00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Original payment method (VISA ending in 4242) will be credited once the item is inspected.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Info Banner
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FFF5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.stars,
                          color: AppTheme.primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Free returns for Gold Members',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ReturnSuccessScreen.routeName);
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Confirm & Finish',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    IconData? icon,
    Widget? iconWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: Color(0xFF4CAF50),
                letterSpacing: 0.5,
              ),
            ),
            if (icon != null)
              Icon(icon, color: AppTheme.mediumGray.withOpacity(0.4), size: 20),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconWidget != null) ...[iconWidget, const SizedBox(width: 16)],
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  height: 1.4,
                  color: AppTheme.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
