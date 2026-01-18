import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.product.originalPrice != null;
    final discountPercentage = hasDiscount
        ? (((widget.product.originalPrice! - widget.product.price) /
                      widget.product.originalPrice!) *
                  100)
              .round()
        : 0;

    // Use product instance directly since it's now source of truth (via Provider list update)
    final isFavorite = widget.product.isFavorite;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  boxShadow: _isHovered ? AppTheme.shadowMd : AppTheme.shadowSm,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image (No Expanded, allow intrinsic height)
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(AppTheme.radiusLarge),
                            bottom: Radius.circular(
                              AppTheme.radiusSmall,
                            ), // Slight curve at bottom of image too
                          ),
                          child: AspectRatio(
                            aspectRatio:
                                1.0, // Square aspect ratio as per design
                            child: Image.asset(
                              widget.product.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, _, __) => Container(
                                color: AppTheme.backgroundGray,
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: AppTheme.mediumGray,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Discount Badge
                        if (hasDiscount)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                gradient: AppTheme.primaryGradient,
                                borderRadius: BorderRadius.circular(
                                  AppTheme.radiusSmall,
                                ),
                                boxShadow: AppTheme.shadowSm,
                              ),
                              child: Text(
                                '-$discountPercentage%',
                                style: const TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        // Favorite Button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: widget.onFavoriteToggle,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: AppTheme.shadowSm,
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                                color: isFavorite
                                    ? AppTheme.errorColor
                                    : AppTheme.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Product Info
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppTheme.spacing12,
                        right: AppTheme.spacing12,
                        top: AppTheme.spacing12,
                        bottom: AppTheme
                            .spacing16, // Extra padding to prevent sub-pixel overflow
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.category,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppTheme.mediumGray),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '\$${widget.product.price.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (hasDiscount) ...[
                                const SizedBox(width: 6),
                                Text(
                                  '\$${widget.product.originalPrice!.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: AppTheme.mediumGray,
                                      ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
