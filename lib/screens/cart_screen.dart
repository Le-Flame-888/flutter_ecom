import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/cart_item_card.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    final double subtotal = cart.totalAmount;
    final double discount = subtotal > 100 ? 20.0 : 0.0; // Dummy logic
    final double total = subtotal - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.black),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text(
          'SHOPPING BAG',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppTheme.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
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
                              Icons.shopping_bag_outlined,
                              size: 40,
                              color: Color(0xFFBDBDBD),
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'YOUR BAG IS EMPTY',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.black,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Looks like you haven\'t added\nany items yet.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFBDBDBD),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(24),
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      final item = cart.items.values.toList()[i];
                      final productId = cart.items.keys.toList()[i];
                      return CartItemCard(productId: productId, cartItem: item);
                    },
                  ),
          ),

          // Checkout Section
          Container(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Discount Code
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.confirmation_num_outlined,
                        size: 20,
                        color: AppTheme.black,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'PROMO CODE',
                            hintStyle: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFBDBDBD),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4CAF50),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                _buildSummaryRow(
                  'Subtotal',
                  '\$${subtotal.toStringAsFixed(2)}',
                  false,
                ),
                const SizedBox(height: 12),
                _buildSummaryRow(
                  'Discount',
                  '-\$${discount.toStringAsFixed(2)}',
                  true,
                ),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFFF3F3F3), height: 1),
                const SizedBox(height: 20),
                _buildSummaryRow(
                  'Total Amount',
                  '\$${total.toStringAsFixed(2)}',
                  false,
                  isTotal: true,
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cart.items.isEmpty) return;
                      Navigator.of(context).pushNamed(CheckoutScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cart.items.isEmpty
                          ? const Color(0xFFF3F3F3)
                          : AppTheme.primaryColor,
                      foregroundColor: cart.items.isEmpty
                          ? const Color(0xFFBDBDBD)
                          : AppTheme.black,
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'CHECKOUT NOW',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: cart.items.isEmpty
                              ? const Color(0xFFBDBDBD)
                              : AppTheme.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    bool isDiscount, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? AppTheme.black : AppTheme.mediumGray,
            fontWeight: isTotal ? FontWeight.w900 : FontWeight.w600,
            fontSize: isTotal ? 18 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: isTotal ? 24 : 16,
            color: isDiscount ? const Color(0xFF4CAF50) : AppTheme.black,
          ),
        ),
      ],
    );
  }
}
