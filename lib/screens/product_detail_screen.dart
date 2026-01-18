import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = 'L';
  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final argProduct = ModalRoute.of(context)!.settings.arguments as Product;
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.findById(argProduct.id);

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'DETAILS',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1.5,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite
                      ? AppTheme.errorColor
                      : AppTheme.black,
                ),
                onPressed: () =>
                    productProvider.toggleFavoriteStatus(product.id),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Image Carousel Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 380,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: product.id,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Image.asset(
                              product.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          width: index == _currentImageIndex ? 24 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: index == _currentImageIndex
                                ? AppTheme.primaryColor
                                : Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Thumbnails
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(4, (index) {
                  final isSelected = index == 0;
                  return Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(16),
                      border: isSelected
                          ? Border.all(color: AppTheme.primaryColor, width: 2)
                          : null,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OUTERWEAR MEN',
                    style: TextStyle(
                      color: AppTheme.mediumGray,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                          ),
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Size Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SELECT SIZE',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        'Size Guide',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _sizes.map((size) {
                      final isSelected = _selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedSize = size),
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primaryColor
                                : const Color(0xFFF9F9F9),
                            shape: BoxShape.circle,
                            border: isSelected
                                ? null
                                : Border.all(color: const Color(0xFFEDEDED)),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: isSelected
                                  ? AppTheme.black
                                  : AppTheme.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 32),

                  // Product Info Description
                  const Text(
                    'PRODUCT INFO',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(text: product.description),
                        TextSpan(
                          text: '... Learn More',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Shipping Info
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            color: AppTheme.primaryColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Free Express Shipping',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Estimated delivery: 2-3 business days',
                                style: TextStyle(
                                  color: AppTheme.mediumGray,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Provider.of<CartProvider>(
              context,
              listen: false,
            ).addToCart(product);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Added to Cart!')));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: AppTheme.black,
            minimumSize: const Size(double.infinity, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shopping_bag, size: 20),
              SizedBox(width: 12),
              Text(
                'ADD TO CART',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
