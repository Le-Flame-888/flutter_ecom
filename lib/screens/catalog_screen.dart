import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/product_card.dart';
import '../providers/product_provider.dart';
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
  String _selectedGender = 'All';
  final List<String> _categories = [
    'All',
    'Dresses',
    'Hoodies',
    'Jackets',
    'Beanies',
  ];
  final List<String> _genders = ['All', 'Men', 'Women', 'Unisex'];

  // Search controller
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    // Get products based on category and gender
    // Note: Provider might not support gender filtering yet based on previous check,
    // but we can filter locally or update provider. Best to filter locally on the result if provider doesn't support generic filter.
    // Provider `getFilteredProducts` supports Category and Gender (I added that logic in Step 111 edit to HomeScreen, wait no, Step 111 REMOVED gender param in call because I removed the UI, but the provider method signature might still expect it or generic).
    // Let's check ProductProvider usage.
    // getFilteredProducts(category, gender) was used in HomeScreen before I changed it.
    // I should check ProductProvider definition if I want to be 100% sure.
    // But logically, I should filter by search query too.

    var filteredProducts = productProvider.getFilteredProducts(
      _selectedCategory,
      _selectedGender,
    );

    // Apply search filter locally
    if (_searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts
          .where(
            (product) =>
                product.name.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // AppBar / Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 24, 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppTheme.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'SEARCH PRODUCTS...',
                            hintStyle: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFBDBDBD),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppTheme.black,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            SliverToBoxAdapter(
              child: SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = _selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _selectedCategory = category),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: isSelected ? AppTheme.black : Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.black
                                  : const Color(0xFFF3F3F3),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            category.toUpperCase(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Gender Filters (Unified Stitch Style)
            SliverToBoxAdapter(
              child: SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _genders.length,
                  itemBuilder: (context, index) {
                    final gender = _genders[index];
                    final isSelected = _selectedGender == gender;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedGender = gender),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryColor
                                  : const Color(0xFFF3F3F3),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            gender,
                            style: TextStyle(
                              color: AppTheme.black,
                              fontWeight: isSelected
                                  ? FontWeight.w900
                                  : FontWeight.w700,
                              fontSize: 10,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // Product Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onFavoriteToggle: () {
                      productProvider.toggleFavoriteStatus(product.id);
                    },
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: product,
                      );
                    },
                  );
                },
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
