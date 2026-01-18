enum OrderStatus { processing, inTransit, delivered, cancelled }

class OrderItem {
  final String productId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class Order {
  final String id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderItem> items;
  final double totalAmount;
  final String trackingNumber;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.items,
    required this.totalAmount,
    this.trackingNumber = '',
  });
}
