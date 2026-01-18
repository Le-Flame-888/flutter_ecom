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
        backgroundColor: AppTheme.backgroundLight,
        appBar: AppBar(
          backgroundColor: AppTheme.backgroundLight.withOpacity(0.9),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: AppTheme.primaryColor,
            unselectedLabelColor: AppTheme.mediumGray,
            indicatorColor: AppTheme.primaryColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
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
            Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: AppTheme.mediumGray.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No orders found',
              style: TextStyle(
                color: AppTheme.mediumGray,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
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
        statusText = 'Processing';
        break;
      case OrderStatus.inTransit:
        statusColor = Colors.orange;
        statusText = 'In Transit';
        break;
      case OrderStatus.delivered:
        statusColor = AppTheme.primaryColor;
        statusText = 'Delivered';
        break;
      case OrderStatus.cancelled:
        statusColor = Colors.red;
        statusText = 'Cancelled';
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        boxShadow: AppTheme.shadowSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  const SizedBox(height: 2),
                  Text(
                    order.id,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
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
                    color: statusColor == AppTheme.primaryColor
                        ? Colors.green[800]
                        : statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            DateFormat('MMM dd, yyyy, hh:mm a').format(order.date),
            style: const TextStyle(color: AppTheme.mediumGray, fontSize: 13),
          ),
          const Divider(height: 24),

          // Product Thumbnails
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.lightGray,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(order.items[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: View Details
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.black,
                    side: const BorderSide(color: AppTheme.lightGray),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppTheme.radiusMedium,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('View Details'),
                ),
              ),
              const SizedBox(width: 12),
              if (order.status == OrderStatus.inTransit ||
                  order.status == OrderStatus.processing)
                Expanded(
                  child: ElevatedButton(
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
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusMedium,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Track Order'),
                  ),
                )
              else if (order.status == OrderStatus.delivered)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Reorder Logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: AppTheme.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusMedium,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Reorder'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
