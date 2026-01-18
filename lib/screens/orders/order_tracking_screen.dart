import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class OrderTrackingScreen extends StatelessWidget {
  static const routeName = '/order-tracking';

  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderId =
        ModalRoute.of(context)?.settings.arguments as String? ?? '#12345';

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
          'ORDER TRACKING',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 28,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ORDER $orderId',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '3 ITEMS • \$89.99',
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Status Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TRACKING STATUS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ON THE WAY',
                    style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Timeline
            _buildTimelineStep(
              context,
              title: 'Order Placed',
              subtitle: 'OCT 24, 10:00 AM',
              isCompleted: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'Processing',
              subtitle: 'OCT 24, 02:30 PM',
              isCompleted: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'Shipped',
              subtitle: 'OCT 25, 08:45 AM',
              isCompleted: false,
              isActive: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'Delivered',
              subtitle: 'ESTIMATED OCT 26',
              isCompleted: false,
              isLast: true,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isActive = false,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppTheme.black
                    : (isActive ? AppTheme.primaryColor : Colors.white),
                shape: BoxShape.circle,
                border: !isCompleted && !isActive
                    ? Border.all(color: const Color(0xFFF3F3F3), width: 2)
                    : null,
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : (isActive
                        ? const Center(
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: AppTheme.black,
                            ),
                          )
                        : null),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: isCompleted ? AppTheme.black : const Color(0xFFF3F3F3),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 0.5,
                  color: isCompleted || isActive
                      ? AppTheme.black
                      : const Color(0xFFBDBDBD),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: isActive
                      ? AppTheme.primaryColor
                      : const Color(0xFFBDBDBD),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
