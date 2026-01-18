import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_card.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'YOUR WISHLIST',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${favoriteProducts.length}',
                  style: const TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: favoriteProducts.isEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 40,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'NO FAVORITES YET',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.black,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Tap the heart icon on any product\nto save it here for later.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 48),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.black,
                          foregroundColor: AppTheme.primaryColor,
                          minimumSize: const Size(220, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'START BROWSING',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 24,
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
    );
  }
}
