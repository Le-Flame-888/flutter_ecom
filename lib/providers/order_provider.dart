import 'package:flutter/foundation.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [
    Order(
      id: 'ORD-8842',
      date: DateTime.now(), // Today
      status: OrderStatus.processing,
      totalAmount: 149.99,
      items: [
        OrderItem(
          productId: 'p1',
          name: 'Lime Green Hoodie',
          imageUrl: 'assets/images/products/hoodies/hoodie_1.jpg',
          price: 89.99,
          quantity: 1,
        ),
        OrderItem(
          productId: 'p2',
          name: 'Black T-Shirt',
          imageUrl:
              'assets/images/products/dresses/dress_1.jpg', // Fallback image
          price: 29.99,
          quantity: 1,
        ),
      ],
    ),
    Order(
      id: 'ORD-9012',
      date: DateTime.now().subtract(const Duration(days: 3)),
      status: OrderStatus.inTransit,
      totalAmount: 89.99,
      trackingNumber: 'TRK9988776655',
      items: [
        OrderItem(
          productId: 'p3',
          name: 'Green Running Shoes',
          imageUrl: 'assets/images/products/jackets/jacket_1.jpg', // Fallback
          price: 89.99,
          quantity: 1,
        ),
      ],
    ),
    Order(
      id: 'ORD-7721',
      date: DateTime.now().subtract(const Duration(days: 20)),
      status: OrderStatus.delivered,
      totalAmount: 245.00,
      items: [
        OrderItem(
          productId: 'p4',
          name: 'Winter Trench Coat',
          imageUrl: 'assets/images/products/jackets/jacket_2.jpg',
          price: 195.00,
          quantity: 1,
        ),
        OrderItem(
          productId: 'p5',
          name: 'Denim Shorts',
          imageUrl: 'assets/images/products/dresses/dress_2.jpg', // Fallback
          price: 50.00,
          quantity: 1,
        ),
      ],
    ),
  ];

  List<Order> get orders => [..._orders];

  List<Order> get activeOrders => _orders
      .where(
        (order) =>
            order.status == OrderStatus.processing ||
            order.status == OrderStatus.inTransit,
      )
      .toList();

  List<Order> get completedOrders =>
      _orders.where((order) => order.status == OrderStatus.delivered).toList();

  List<Order> get cancelledOrders =>
      _orders.where((order) => order.status == OrderStatus.cancelled).toList();

  Order findById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }
}
