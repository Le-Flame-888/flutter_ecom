class Product {
  final String id;
  final String name;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String category;
  final String description;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.category,
    required this.description,
    this.isFavorite = false,
  });
}
