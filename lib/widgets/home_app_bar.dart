import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryColor, width: 2),
            ),
            child: ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBshIPnizPYPXi9u-_s9RPhNhR2zp9rr_WLpZ80LwYO4DtqaEFLILnZXgUte8OrhqB-g_IqWLQM2NV_njZaNUh3YlvG4jAOWoWGdo25AYYHAjRcNLzLU6JacadulZ8zPr1O0_Azz9RGfDfqevmqIRjBYLTP5XMiTHDUaQpGFa60BwiXaffnXIpVATJzDX8LcqiGlhcqLNPDBYGeG8EK628s46_UZ7c_UlmcrQ-WUmZc6LaN5KVv2ddcIa02wwCcVSZOFmPNTwFKUigQ',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppTheme.lightGray,
                  child: const Icon(Icons.person, color: AppTheme.mediumGray),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hey, Alex',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.expand_more, size: 16),
                ],
              ),
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.mediumGray,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppTheme.darkGray
                      : AppTheme.lightGray,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications_none, size: 20),
              ),
              Positioned(
                top: 10,
                right: 11,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
