import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../theme/app_theme.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import 'order_tracking_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'MY ORDERS',
            style: TextStyle(
              color: AppTheme.black,
              fontWeight: FontWeight.w900,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: AppTheme.black,
            unselectedLabelColor: const Color(0xFFBDBDBD),
            indicatorColor: AppTheme.primaryColor,
            indicatorWeight: 4,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            tabs: const [
              Tab(text: 'ACTIVE'),
              Tab(text: 'COMPLETED'),
              Tab(text: 'CANCELLED'),
            ],
          ),
        ),
        body: Consumer<OrderProvider>(
          builder: (context, orderData, child) {
            return TabBarView(
              children: [
                _buildOrderList(context, orderData.activeOrders),
                _buildOrderList(context, orderData.completedOrders),
                _buildOrderList(context, orderData.cancelledOrders),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, List<Order> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 40,
                color: Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No orders found',
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(context, orders[index]);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, Order order) {
    Color statusColor;
    String statusText;

    switch (order.status) {
      case OrderStatus.processing:
        statusColor = Colors.blue;
        statusText = 'PROCESSING';
        break;
      case OrderStatus.inTransit:
        statusColor = const Color(0xFF4CAF50);
        statusText = 'ON THE WAY';
        break;
      case OrderStatus.delivered:
        statusColor = const Color(0xFF4CAF50);
        statusText = 'DELIVERED';
        break;
      case OrderStatus.cancelled:
        statusColor = Colors.red;
        statusText = 'CANCELLED';
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFF3F3F3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ORDER ${order.id.toUpperCase()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('MMMM dd, yyyy').format(order.date),
            style: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(color: Color(0xFFF3F3F3), height: 1),
          ),

          // Product Thumbnails
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    order.items[index].imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (ctx, err, stack) =>
                        const Icon(Icons.shopping_bag_outlined),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Footer & Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TOTAL',
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${order.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (order.status == OrderStatus.inTransit ||
                      order.status == OrderStatus.processing)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          OrderTrackingScreen.routeName,
                          arguments: order.id,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Track',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    )
                  else if (order.status == OrderStatus.delivered)
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Reorder',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {},
                    color: AppTheme.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
