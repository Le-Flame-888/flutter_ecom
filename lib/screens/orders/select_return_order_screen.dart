import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../theme/app_theme.dart';
import '../../providers/order_provider.dart';
import 'return_reason_screen.dart';

class SelectReturnOrderScreen extends StatelessWidget {
  static const routeName = '/select-return-order';

  const SelectReturnOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.black,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select Order',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderData, child) {
          final eligibleOrders = orderData.completedOrders;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Eligible Orders',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.black,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Select an order from the last 30 days to start\nyour return process.',
                      style: TextStyle(
                        color: AppTheme.mediumGray,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  itemCount: eligibleOrders.length,
                  itemBuilder: (context, index) {
                    final order = eligibleOrders[index];
                    // Logic for days left - simple mock for now
                    final daysLeft = 30 - index * 6;
                    final badgeColor = daysLeft <= 2
                        ? const Color(0xFFFFEBEE)
                        : (daysLeft <= 15
                              ? const Color(0xFFF3F3F3)
                              : const Color(0xFFF9FFF5));
                    final textColor = daysLeft <= 2
                        ? const Color(0xFFC62828)
                        : (daysLeft <= 15
                              ? AppTheme.mediumGray
                              : const Color(0xFF2E7D32));
                    final badgeText = daysLeft <= 2
                        ? 'FINAL $daysLeft DAYS'
                        : '$daysLeft DAYS LEFT';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: const Color(0xFFF3F3F3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order #${order.id.split('-').last}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Delivered ${DateFormat('MMM dd, yyyy').format(order.date)}',
                                      style: const TextStyle(
                                        color: Color(0xFF4CAF50),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: badgeColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    badgeText,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                      color: textColor,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Item Thumbnails
                            SizedBox(
                              height: 70,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: order.items.length,
                                itemBuilder: (ctx, i) => Container(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F3F3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    order.items[i].imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Divider(color: Color(0xFFF3F3F3), height: 1),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${order.items.length} Items • Total \$${order.totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: AppTheme.mediumGray,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(ReturnReasonScreen.routeName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.primaryColor,
                                    foregroundColor: AppTheme.black,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
