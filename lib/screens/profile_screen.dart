import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import 'support/help_center_screen.dart';
import 'orders/order_history_screen.dart';
import 'style_quiz/style_quiz_screen.dart';
import 'loyalty_screen.dart';
import 'store_locator/store_locator_screen.dart';
import 'settings/settings_screen.dart';
import 'refer_friend_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                  child: Text(
                    user?.email?.isNotEmpty == true
                        ? user!.email![0].toUpperCase()
                        : 'U',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.email ?? 'Guest User',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Member since 2025',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.mediumGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing32),

            // Account Settings
            Text(
              'Account',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.spacing16),
            _buildProfileItem(
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              onTap: () {
                Navigator.of(context).pushNamed(OrderHistoryScreen.routeName);
              },
            ),
            _buildProfileItem(
              icon: Icons.location_on_outlined,
              title: 'Shipping Addresses',
              onTap: () {},
            ),
            _buildProfileItem(
              icon: Icons.loyalty_outlined,
              title: 'My Rewards',
              onTap: () {
                Navigator.of(context).pushNamed(LoyaltyScreen.routeName);
              },
            ),
            _buildProfileItem(
              icon: Icons.style_outlined,
              title: 'Style Quiz',
              onTap: () {
                Navigator.of(context).pushNamed(StyleQuizScreen.routeName);
              },
            ),

            _buildProfileItem(
              icon: Icons.store_mall_directory_outlined,
              title: 'Store Locator',
              onTap: () {
                Navigator.of(context).pushNamed(StoreLocatorScreen.routeName);
              },
            ),
            _buildProfileItem(
              icon: Icons.card_giftcard_outlined,
              title: 'Refer a Friend',
              onTap: () {
                Navigator.of(context).pushNamed(ReferFriendScreen.routeName);
              },
            ),

            const SizedBox(height: AppTheme.spacing32),

            // App Settings
            Text(
              'Settings',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.spacing16),
            _buildProfileItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            ),
            _buildProfileItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {
                Navigator.of(context).pushNamed(HelpCenterScreen.routeName);
              },
            ),

            const SizedBox(height: AppTheme.spacing48),

            // Sign Out Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut();
                  if (context.mounted) {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.errorColor.withOpacity(0.1),
                  foregroundColor: AppTheme.errorColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        boxShadow: AppTheme.shadowSm,
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.black),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppTheme.black,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppTheme.mediumGray,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
      ),
    );
  }
}
