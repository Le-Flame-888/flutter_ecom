import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/home_app_bar.dart';
import '../providers/product_provider.dart';

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
  final List<String> _categories = [
    'All',
    'Dresses',
    'Hoodies',
    'Jackets',
    'Beanies',
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final filteredProducts = productProvider.getFilteredProducts(
      _selectedCategory,
      'All', // Default gender as we removed the filter UI for now to match design
    );

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar
                  const HomeAppBar(),

                  // Search & Filter Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppTheme.darkGray
                                  : AppTheme.lightGray,
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusMedium,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : AppTheme.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Explore Fashion',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppTheme.mediumGray,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
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
                              // TODO: Show Filter Bottom Sheet
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Hero Banner
                  const HeroBanner(),

                  const SizedBox(height: 24),

                  // Category Chips
                  SizedBox(
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppTheme.black
                                          : AppTheme.primaryColor)
                                    : (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppTheme.lightGray
                                          : AppTheme.darkGray),
                                borderRadius: BorderRadius.circular(
                                  AppTheme.radiusFull,
                                ),
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: isSelected
                                      ? (Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.white
                                            : AppTheme.black)
                                      : (Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppTheme.black
                                            : Colors.white),
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

                  const SizedBox(height: 16),

                  // "Special For You" Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Special For You',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
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
                            style: TextStyle(
                              color: AppTheme.mediumGray,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

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
                    onFavoriteToggle: () {},
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

            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
    );
  }
}
