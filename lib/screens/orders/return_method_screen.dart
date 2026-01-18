import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'return_reason_screen.dart';
import 'return_confirm_screen.dart';

class ReturnMethodScreen extends StatefulWidget {
  static const routeName = '/return-method';

  const ReturnMethodScreen({super.key});

  @override
  State<ReturnMethodScreen> createState() => _ReturnMethodScreenState();
}

class _ReturnMethodScreenState extends State<ReturnMethodScreen> {
  String _selectedMethod = 'Courier Pickup';

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
          'Return Method',
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
            child: ReturnStepIndicator(currentStep: 2),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Methods
                  _buildMethodItem(
                    id: 'Drop-off at Store',
                    title: 'Drop-off at Store',
                    subtitle: 'Free • Immediate processing',
                    icon: Icons.store_outlined,
                  ),
                  _buildMethodItem(
                    id: 'Courier Pickup',
                    title: 'Courier Pickup',
                    subtitle: '\$5.00 • Scheduled pickup',
                    icon: Icons.local_shipping_outlined,
                  ),

                  const SizedBox(height: 32),

                  // Address Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PICKUP ADDRESS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.black,
                          letterSpacing: 1,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Color(0xFF4CAF50),
                        ),
                        label: const Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Home Office',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '123 Fashion Ave, Suite 4B\nNew York, NY 10001',
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
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Map Mock
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDtMh_T_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.black.withOpacity(0.05),
                      ),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.8),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                        ),
                      ),
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
            Navigator.of(context).pushNamed(ReturnConfirmScreen.routeName);
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
                'Confirm Method',
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

  Widget _buildMethodItem({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    bool isSelected = _selectedMethod == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : AppTheme.mediumGray,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? const Color(0xFF4CAF50)
                          : AppTheme.mediumGray,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppTheme.primaryColor : Colors.white,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : const Color(0xFFE0E0E0),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 16, color: AppTheme.black),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
