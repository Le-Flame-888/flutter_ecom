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
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Track Order',
          style: TextStyle(color: AppTheme.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                boxShadow: AppTheme.shadowSm,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 32,
                      color: AppTheme.mediumGray,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.mediumGray,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        orderId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '3 Items • \$89.99',
                        style: TextStyle(color: AppTheme.mediumGray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Status Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Status',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ON THE WAY',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Timeline
            _buildTimelineStep(
              context,
              title: 'Order Placed',
              subtitle: 'Oct 24, 10:00 AM',
              isCompleted: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'Processing',
              subtitle: 'Oct 24, 02:30 PM',
              isCompleted: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'On the Way',
              subtitle: 'Active now • 2 miles away',
              isCompleted: false,
              isActive: true,
              isLast: false,
            ),
            _buildTimelineStep(
              context,
              title: 'Delivered',
              subtitle: 'Estimated Oct 25',
              isCompleted: false,
              isLast: true,
            ),
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
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppTheme.primaryColor
                    : (isActive
                          ? AppTheme.primaryColor.withOpacity(0.2)
                          : Colors.transparent),
                shape: BoxShape.circle,
                border: isActive || !isCompleted
                    ? Border.all(
                        color: isActive
                            ? AppTheme.primaryColor
                            : AppTheme.lightGray,
                        width: 2,
                      )
                    : null,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, size: 18, color: AppTheme.black)
                    : (isActive
                          ? const Icon(
                              Icons.local_shipping,
                              size: 18,
                              color: AppTheme.black,
                            )
                          : const Icon(
                              Icons.inventory_2,
                              size: 18,
                              color: AppTheme.mediumGray,
                            )),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? AppTheme.primaryColor : AppTheme.lightGray,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isCompleted || isActive
                    ? AppTheme.black
                    : AppTheme.mediumGray,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: isActive ? AppTheme.primaryColor : AppTheme.mediumGray,
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}
