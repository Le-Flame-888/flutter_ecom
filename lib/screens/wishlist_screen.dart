import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../providers/wishlist_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/empty_state.dart';
import 'product_detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({super.key});

  // All products (should match home/catalog screens)
  static final List<Product> _allProducts = [
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
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final favoriteProducts = wishlistProvider.getFavoriteProducts(_allProducts);

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacing16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Wishlist',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                    ),
                    child: Text(
                      '${favoriteProducts.length} items',
                      style: const TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacing8),

            // Grid or Empty State
            Expanded(
              child: favoriteProducts.isEmpty
                  ? EmptyState(
                      icon: Icons.favorite_border,
                      title: 'No Favorites Yet',
                      message:
                          'Start adding products to your wishlist by tapping the heart icon!',
                      actionText: 'Browse Products',
                      onAction: () {
                        // Navigate to catalog or home
                        Navigator.of(context).pop();
                      },
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(AppTheme.spacing16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: favoriteProducts[index],
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetailScreen.routeName,
                              arguments: favoriteProducts[index],
                            );
                          },
                          onFavoriteToggle: () {
                            // Provider already handles the toggle
                          },
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
