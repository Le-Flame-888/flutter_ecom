import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacing16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppTheme.shadowSm,
            ),
            child: const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacing12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to', style: Theme.of(context).textTheme.bodySmall),
              Text('EFM Store', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacing8),
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.lightGray),
              boxShadow: AppTheme.shadowSm,
            ),
            child: const Icon(
              Icons.notifications_outlined,
              size: 20,
              color: AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
