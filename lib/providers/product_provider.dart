import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    // Dresses
    Product(
      id: 'p1',
      name: 'Summer Floral Dress',
      price: 49.99,
      originalPrice: 69.99,
      imageUrl: 'assets/images/products/dresses/dress_1.jpg',
      category: 'Dresses',
      description: 'Light and breezy summer dress with floral pattern.',
      isFavorite: true,
      gender: 'Women',
    ),
    Product(
      id: 'p2',
      name: 'Elegant Midi Dress',
      price: 79.99,
      imageUrl: 'assets/images/products/dresses/dress_2.jpg',
      category: 'Dresses',
      description: 'Elegant midi dress perfect for any occasion.',
      gender: 'Women',
    ),
    Product(
      id: 'p3',
      name: 'Casual Day Dress',
      price: 39.99,
      imageUrl: 'assets/images/products/dresses/dress_3.jpg',
      category: 'Dresses',
      description: 'Comfortable casual dress for everyday wear.',
      gender: 'Women',
    ),

    // Hoodies
    Product(
      id: 'p4',
      name: 'Casual Hoodie Brown',
      price: 45.00,
      originalPrice: 56.00,
      imageUrl: 'assets/images/products/hoodies/hoodie_1.jpg',
      category: 'Hoodies',
      description: 'Comfortable brown hoodie perfect for casual outings.',
      isFavorite: false,
      gender: 'Women',
    ),
    Product(
      id: 'p5',
      name: 'Classic Black Hoodie',
      price: 68.00,
      imageUrl: 'assets/images/products/hoodies/hoodie_2.jpg',
      category: 'Hoodies',
      description: 'Stylish black hoodie with a modern fit.',
      gender: 'Men',
    ),
    Product(
      id: 'p6',
      name: 'Premium Hoodie',
      price: 89.00,
      originalPrice: 120.00,
      imageUrl: 'assets/images/products/hoodies/hoodie_3.jpg',
      category: 'Hoodies',
      description: 'Premium quality hoodie with superior comfort.',
      gender: 'Men',
    ),

    // Jackets
    Product(
      id: 'p7',
      name: 'Denim Jacket',
      price: 85.00,
      originalPrice: 120.00,
      imageUrl: 'assets/images/products/jackets/jacket_1.jpg',
      category: 'Jackets',
      description: 'Classic denim jacket for all seasons.',
      gender: 'Unisex',
    ),
    Product(
      id: 'p8',
      name: 'Leather Bomber Jacket',
      price: 149.99,
      imageUrl: 'assets/images/products/jackets/jacket_2.jpg',
      category: 'Jackets',
      description: 'Premium leather bomber jacket.',
      gender: 'Men',
    ),

    // Beanies
    Product(
      id: 'p9',
      name: 'Wool Beanie',
      price: 24.99,
      imageUrl: 'assets/images/products/beanies/beanie_1.jpg',
      category: 'Beanies',
      description: 'Warm wool beanie for winter.',
      gender: 'Unisex',
    ),
    Product(
      id: 'p10',
      name: 'Classic Knit Beanie',
      price: 19.99,
      originalPrice: 29.99,
      imageUrl: 'assets/images/products/beanies/beanie_2.jpg',
      category: 'Beanies',
      description: 'Classic knit beanie in multiple colors.',
      gender: 'Unisex',
    ),
  ];

  List<Product> get products => [..._products];

  List<Product> getFilteredProducts(String category, String gender) {
    return _products.where((product) {
      final matchesCategory = category == 'All' || product.category == category;
      final matchesGender = gender == 'All' || product.gender == gender;
      return matchesCategory && matchesGender;
    }).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void toggleFavoriteStatus(String id) {
    final productIndex = _products.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _products[productIndex].isFavorite = !_products[productIndex].isFavorite;
      notifyListeners();
    }
  }
}
