import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'live_chat_screen.dart';
import '../orders/select_return_order_screen.dart';

class HelpCenterScreen extends StatelessWidget {
  static const routeName = '/help-center';

  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'HELP CENTER',
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Search Bar
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const TextField(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'HOW CAN WE HELP?',
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
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Popular Topics
            const Text(
              'POPULAR TOPICS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: AppTheme.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildTopicCard(
                  context,
                  icon: Icons.local_shipping_outlined,
                  title: 'Track Order',
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.assignment_return_outlined,
                  title: 'Returns',
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(SelectReturnOrderScreen.routeName),
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.payment_outlined,
                  title: 'Payment',
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.shopping_bag_outlined,
                  title: 'Promos',
                ),
              ],
            ),
            const SizedBox(height: 48),

            // Contact Us
            const Text(
              'GET IN TOUCH',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: AppTheme.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              context,
              icon: Icons.chat_bubble_outline,
              title: 'Live Chat',
              subtitle: 'Speak to our team now',
              isOnline: true,
              onTap: () =>
                  Navigator.of(context).pushNamed(LiveChatScreen.routeName),
            ),
            _buildContactItem(
              context,
              icon: Icons.mail_outline,
              title: 'Email',
              subtitle: 'Response within 24h',
              onTap: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF3F3F3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppTheme.black, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    bool isOnline = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppTheme.black),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      if (isOnline) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.mediumGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppTheme.black,
            ),
          ],
        ),
      ),
    );
  }
}
