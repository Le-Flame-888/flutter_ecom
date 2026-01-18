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
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppTheme.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField('Full Name', Icons.person_outline),
              const SizedBox(height: 12),
              _buildTextField('Address', Icons.location_on_outlined),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField('City', Icons.location_city)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField('Zip Code', Icons.numbers)),
                ],
              ),

              const SizedBox(height: 32),

              // Payment Method
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildPaymentOption(0, 'Credit Card', Icons.credit_card),
              const SizedBox(height: 12),
              _buildPaymentOption(1, 'PayPal', Icons.payment),

              const SizedBox(height: 48),

              // Order Summary
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.lightGray),
                  boxShadow: AppTheme.shadowSm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 16, color: AppTheme.darkGray),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to confirmation
                    cart.clearCart();
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(ConfirmationScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.black,
                    foregroundColor: AppTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.shadowSm,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppTheme.mediumGray),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppTheme.whiteColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          labelStyle: const TextStyle(color: AppTheme.mediumGray),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int value, String title, IconData icon) {
    final isSelected = _selectedPayment == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPayment = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : AppTheme.lightGray,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : AppTheme.shadowSm,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.black : AppTheme.mediumGray,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppTheme.black : AppTheme.darkGray,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppTheme.primaryColor),
          ],
        ),
      ),
    );
  }
}
