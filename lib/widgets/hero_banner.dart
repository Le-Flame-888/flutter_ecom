import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 192),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          color: AppTheme.darkGray, // bg-zinc-900
          image: const DecorationImage(
            image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAL2GOqBY-ZC9LqhtZ8RAyiR4O2IMo5fslWuD2m_sZ1eKEia4KaDW1z0eMLBW5CXY9nCWPkuuuPMDD3g3l0zoAblcCUb-cDBm9AgBfQNvAGh-XrrjElyeVUbZA_Io3xAx42jaNbq3Si1Wg_wwLA9dwWwswGKHyQ3yFY6KFF1OaG1JRRCPeP78XQ4cq1K3ST6Qtco52klWTClfa0HSbkTzLWSJkpIXZcpIcwxRt_y8kA7jsgPUIpdj1J5icf2xyTHCO3mcdAC4vHWhW8',
            ),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SEASONAL OFFER',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 180,
                    child: Text(
                      'Super Sale Discount Up to 50%',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: AppTheme.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusFull,
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    child: const Text('Shop Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
