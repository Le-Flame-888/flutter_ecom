import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../theme/app_theme.dart';
import '../widgets/category_pill.dart';
import '../widgets/product_card.dart';
import '../widgets/hero_carousel.dart';
import '../widgets/floating_search_bar.dart';
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
  String _selectedGender = 'All'; // Gender filter
  final List<String> _categories = [
    'All',
    'Dresses',
    'Hoodies',
    'Jackets',
    'Beanies',
  ];
  final List<String> _genders = ['All', 'Men', 'Women', 'Unisex'];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final filteredProducts = productProvider.getFilteredProducts(
      _selectedCategory,
      _selectedGender,
    );

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar
                  const HomeAppBar(),

                  const SizedBox(height: AppTheme.spacing8),

                  // Search Bar
                  const FloatingSearchBar(),

                  const SizedBox(height: AppTheme.spacing24),

                  // Hero Carousel
                  const HeroCarousel(),

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
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
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
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // Product Grid with Provider Data (Masonry)
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
