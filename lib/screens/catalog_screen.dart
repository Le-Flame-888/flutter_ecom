import 'package:flutter/material.dart';

import '../widgets/category_pill.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  static const routeName = '/catalog';

  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'Dresses';
  final List<String> _categories = ['All', 'Dresses', 'Jackets', 'Jeans'];

  // Dummy Data
  final List<Product> _products = [
    Product(
      id: 'p1',
      name: 'Casual Hoodie Brown',
      price: 45.00,
      originalPrice: 56.00,
      imageUrl:
          'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=600&q=80',
      category: 'Outerwear Women',
      description: 'Comfortable brown hoodie.',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      name: 'Casual Hoodie Black',
      price: 68.00,
      imageUrl:
          'https://images.unsplash.com/photo-1578932750294-f5075e142d18?auto=format&fit=crop&w=600&q=80',
      category: 'Outerwear Men',
      description: 'Stylish black hoodie.',
    ),
    Product(
      id: 'p3',
      name: 'Denim Jacket',
      price: 85.00,
      originalPrice: 120.00,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80',
      category: 'Jackets',
      description: 'Classic denim jacket.',
    ),
    Product(
      id: 'p4',
      name: 'Summer Dress',
      price: 49.99,
      imageUrl:
          'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?auto=format&fit=crop&w=600&q=80',
      category: 'Dresses',
      description: 'Light and breezy summer dress.',
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
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: _products[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: _products[index],
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
}
