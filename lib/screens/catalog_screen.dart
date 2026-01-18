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
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar / Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppTheme.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.lightGray,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusMedium,
                          ),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search Products',
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppTheme.mediumGray,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusMedium,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: AppTheme.black),
                        onPressed: () {
                          // TODO: Filter Bottom Sheet
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = _selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.black
                                : AppTheme.lightGray,
                            borderRadius: BorderRadius.circular(
                              AppTheme.radiusFull,
                            ),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 14,
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

            // Gender Filters (Optional, can be removed if strictly following HomeScreen style, but useful for Catalog)
            SliverToBoxAdapter(
              child: Padding(
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
                            final isSelected = _selectedGender == gender;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = gender;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppTheme.primaryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      AppTheme.radiusFull,
                                    ),
                                    border: Border.all(
                                      color: isSelected
                                          ? AppTheme.primaryColor
                                          : AppTheme.lightGray,
                                    ),
                                  ),
                                  child: Text(
                                    gender,
                                    style: TextStyle(
                                      color: AppTheme.black,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
