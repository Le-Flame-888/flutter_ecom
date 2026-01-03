import 'package:flutter/material.dart';

import '../widgets/category_pill.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  static const routeName = '/catalog';

  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'All';
  String _selectedGender = 'All'; // Gender filter
  final List<String> _categories = [
    'All',
    'Dresses',
    'Hoodies',
    'Jackets',
    'Beanies',
  ];
  final List<String> _genders = ['All', 'Men', 'Women', 'Unisex'];

  // Product Data with local assets (same as home screen)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Explore Fashion',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.tune, color: Colors.black),
                  ),
                ],
              ),
            ),

            // Categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return CategoryPill(
                    label: category,
                    isSelected: _selectedCategory == category,
                    icon: category == 'Dresses'
                        ? Icons.check_circle_outline
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Gender Filter Pills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Gender:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      color: AppTheme.darkGray,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _genders.length,
                        itemBuilder: (context, index) {
                          final gender = _genders[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CategoryPill(
                              label: gender,
                              isSelected: _selectedGender == gender,
                              onTap: () {
                                setState(() {
                                  _selectedGender = gender;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Product Grid Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Special For You',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _getFilteredProducts().length,
                itemBuilder: (context, index) {
                  final filteredProducts = _getFilteredProducts();
                  return ProductCard(
                    product: filteredProducts[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: filteredProducts[index],
                      );
                    },
                    onFavoriteToggle: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter products by category and gender
  List<Product> _getFilteredProducts() {
    return _products.where((product) {
      // Category filter
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;

      // Gender filter
      final matchesGender =
          _selectedGender == 'All' || product.gender == _selectedGender;

      return matchesCategory && matchesGender;
    }).toList();
  }
}
