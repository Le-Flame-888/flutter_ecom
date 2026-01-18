import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';
import '../theme/app_theme.dart';

class CartItemCard extends StatelessWidget {
  final String productId;
  final CartItem cartItem;

  const CartItemCard({
    super.key,
    required this.productId,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(
          context,
          listen: false,
        ).removeFromCart(productId);
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppTheme.errorColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete_outline,
          color: AppTheme.errorColor,
          size: 28,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF3F3F3)),
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFF9F9F9),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  cartItem.product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) =>
                      const Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppTheme.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cartItem.product.category.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${cartItem.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      // Quantity Controls
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onTap: () {
                                Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                ).removeSingleItem(productId);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                '${cartItem.quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            _QuantityButton(
                              icon: Icons.add,
                              onTap: () {
                                Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                ).addToCart(cartItem.product);
                              },
                              isAdd: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isAdd;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.isAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isAdd ? AppTheme.black : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: isAdd ? AppTheme.primaryColor : AppTheme.black,
        ),
      ),
    );
  }
}
