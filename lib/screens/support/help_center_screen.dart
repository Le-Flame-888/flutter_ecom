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
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Help Center',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                boxShadow: AppTheme.shadowSm,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'How can we help?',
                  prefixIcon: Icon(Icons.search, color: AppTheme.mediumGray),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: AppTheme.spacing24),

            // Popular Topics
            Text(
              'Popular Topics',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.spacing16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                _buildTopicCard(
                  context,
                  icon: Icons.local_shipping_outlined,
                  title: 'Track Order',
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.assignment_return_outlined,
                  title: 'Returns & Refunds',
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(SelectReturnOrderScreen.routeName),
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.payment_outlined,
                  title: 'Payment Issues',
                ),
                _buildTopicCard(
                  context,
                  icon: Icons.straighten_outlined,
                  title: 'Size Guide',
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing32),

            // Contact Us
            Text(
              'Contact Us',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.spacing16),
            _buildContactItem(
              context,
              icon: Icons.chat_bubble_outline,
              title: 'Live Chat',
              subtitle: 'Speak to our team now',
              isOnline: true,
              onTap: () {
                Navigator.of(context).pushNamed(LiveChatScreen.routeName);
              },
            ),
            _buildContactItem(
              context,
              icon: Icons.mail_outline,
              title: 'Send an Email',
              subtitle: 'Usually respond within 24 hours',
              onTap: () {},
            ),
            _buildContactItem(
              context,
              icon: Icons.call_outlined,
              title: 'Call Support',
              subtitle: 'Mon-Fri, 9am - 6pm',
              onTap: () {},
            ),
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          border: Border.all(color: AppTheme.lightGray),
          boxShadow: AppTheme.shadowSm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppTheme.black, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          border: Border.all(color: AppTheme.lightGray),
          boxShadow: AppTheme.shadowSm,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (isOnline) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'ONLINE',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: AppTheme.mediumGray),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppTheme.mediumGray),
          ],
        ),
      ),
    );
  }
}
