import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import 'confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPayment = 0; // 0 for Card, 1 for PayPal
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final total = cart.totalAmount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'CHECKOUT',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Shipping Address Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SHIPPING ADDRESS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                      letterSpacing: 1,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 14,
                      color: Color(0xFF4CAF50),
                    ),
                    label: const Text(
                      'Change',
                      style: TextStyle(
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Address Card (Stitch Style)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Home Office',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '123 Fashion Ave, Suite 402\nNew York, NY 10001',
                            style: TextStyle(
                              color: AppTheme.mediumGray,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Payment Method Header
              const Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 20),

              _buildPaymentOption(
                0,
                'Credit Card',
                Icons.credit_card,
                '**** **** **** 4242',
              ),
              const SizedBox(height: 12),
              _buildPaymentOption(
                1,
                'PayPal',
                Icons.payment,
                'fashion.enthusiast@email.com',
              ),

              const SizedBox(height: 40),

              // Order Summary Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TOTAL AMOUNT',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.white10),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.shield_outlined,
                          color: Color(0xFF4CAF50),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Secure encrypted payment',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: ElevatedButton(
          onPressed: () {
            cart.clearCart();
            Navigator.of(
              context,
            ).pushReplacementNamed(ConfirmationScreen.routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: AppTheme.black,
            minimumSize: const Size(double.infinity, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 8,
            shadowColor: AppTheme.primaryColor.withOpacity(0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Place Order',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    int value,
    String title,
    IconData icon,
    String subtitle,
  ) {
    final isSelected = _selectedPayment == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = value),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF9FFF5) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppTheme.primaryColor : AppTheme.mediumGray,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppTheme.mediumGray, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppTheme.primaryColor : Colors.white,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : const Color(0xFFE0E0E0),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 16, color: AppTheme.black),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
