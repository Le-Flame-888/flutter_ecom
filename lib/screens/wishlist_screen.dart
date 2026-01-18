import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_card.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/empty_state.dart';
import 'product_detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get favorites from ProductProvider (source of truth is isFavorite flag)
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProducts = productProvider.products
        .where((p) => p.isFavorite)
        .toList();

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
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
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                        Navigator.of(
                          context,
                        ).pop(); // Go back to where we came from (Home or Catalog)
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
                            productProvider.toggleFavoriteStatus(
                              favoriteProducts[index].id,
                            );
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
