import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: isDark ? AppTheme.backgroundDark : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? AppTheme.darkGray : AppTheme.lightGray,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                0,
                Icons.home_outlined,
                Icons.home,
                'Home',
              ),
              _buildNavItem(
                context,
                1,
                Icons.shopping_bag_outlined,
                Icons.shopping_bag,
                'Cart',
              ),
              const SizedBox(width: 48), // Space for center button
              _buildNavItem(
                context,
                3,
                Icons.favorite_border,
                Icons.favorite,
                'Wishlist',
              ),
              _buildNavItem(
                context,
                4,
                Icons.person_outline,
                Icons.person,
                'Profile',
              ),
            ],
          ),
          Positioned(
            top: -24,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: AppTheme.black,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
  ) {
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected
                  ? (isDark ? AppTheme.primaryColor : AppTheme.black)
                  : AppTheme.mediumGray,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? (isDark ? AppTheme.primaryColor : AppTheme.black)
                    : AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
