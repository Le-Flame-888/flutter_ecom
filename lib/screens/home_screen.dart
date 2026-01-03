import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/category_pill.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';

import 'product_detail_screen.dart';
import 'catalog_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-tab';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  // Product Data with local assets
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacing16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: AppTheme.shadowSm,
                      ),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/32.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacing12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'EFM Store',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacing8),
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.lightGray),
                        boxShadow: AppTheme.shadowSm,
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 20,
                        color: AppTheme.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spacing16),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusFull,
                          ),
                          boxShadow: AppTheme.shadowSm,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Explore Fashion',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppTheme.darkGray,
                            ),
                            filled: true,
                            fillColor: AppTheme.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusFull,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: AppTheme.spacing12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacing12),
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacing12),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        shape: BoxShape.circle,
                        boxShadow: AppTheme.shadowSm,
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: AppTheme.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spacing24),

              // Hero Banner
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing16,
                ),
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  boxShadow: AppTheme.shadowMd,
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=800&q=80',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black45,
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Super Sale\nDiscount\nUp to 50%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Category Pills
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
                          : null, // Dummy icon logic
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

              const SizedBox(height: 24),

              // Product Grid Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Special For You',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(CatalogScreen.routeName);
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              // Product Grid with Filtering
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                      onFavoriteToggle: () {
                        // Implement toggle
                      },
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailScreen.routeName,
                          arguments: filteredProducts[index],
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 80), // Space for bottom nav
            ],
          ),
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
