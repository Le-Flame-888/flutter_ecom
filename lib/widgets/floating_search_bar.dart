import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FloatingSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;

  const FloatingSearchBar({super.key, this.onTap, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50, // Fixed height for consistency
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                onTap: onTap,
                readOnly: onTap != null, // Make read-only if acting as a button
                decoration: InputDecoration(
                  hintText: 'Search for clothes...',
                  hintStyle: const TextStyle(
                    color: AppTheme.mediumGray,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppTheme.black,
                    size: 22,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12, // Vertically centered
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacing12),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(AppTheme.spacing12),
              decoration: BoxDecoration(
                color: AppTheme.black, // Dark button for contrast
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.tune,
                color: AppTheme.primaryColor, // Lime icon
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
