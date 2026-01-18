import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LoyaltyScreen extends StatelessWidget {
  static const routeName = '/loyalty';

  const LoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Rewards',
          style: TextStyle(color: AppTheme.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: AppTheme.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Loyalty Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF161D0C), Color(0xFF2A3A18)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CURRENT STATUS',
                            style: TextStyle(
                              color: AppTheme.primaryColor.withOpacity(0.8),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Platinum Member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Circular Progress (Simplified)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              value: 0.75,
                              strokeWidth: 4,
                              backgroundColor: Colors.white.withOpacity(0.1),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.primaryColor,
                              ),
                            ),
                          ),
                          const Text(
                            '75%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '2,450',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Points',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '550 pts to Diamond',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Benefit: 20% Off All Drops',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppTheme.primaryColor,
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),

            // Exclusive Rewards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exclusive Rewards',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppTheme
                          .primaryColor, // Note: This might be hard to read on white if purely primary, consider darkening
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildRewardCard(
                    'EXCLUSIVE',
                    'Exclusive Jacket',
                    '2500 Points',
                    'assets/images/products/jackets/jacket_1.jpg',
                  ),
                  _buildRewardCard(
                    'DESIGNER',
                    'Designer Dress',
                    '3000 Points',
                    'assets/images/products/dresses/dress_1.jpg',
                  ),
                  _buildRewardCard(
                    'PREMIUM',
                    'Premium Accessory',
                    '1500 Points',
                    'assets/images/products/jackets/jacket_2.jpg',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // How to Earn More
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'How to Earn More',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildEarnItem(
                    icon: Icons.group_add,
                    title: 'Refer a Friend',
                    subtitle: 'Give \$20, Get \$20 + 200 pts',
                    isHighlight: true,
                  ),
                  _buildEarnItem(
                    icon: Icons.rate_review,
                    title: 'Write a Review',
                    subtitle: 'Earn +20 pts per review',
                  ),
                  _buildEarnItem(
                    icon: Icons.event_available,
                    title: 'Daily Check-in',
                    subtitle: 'Earn +5 pts every day',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recent Activity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildHistoryItem(
                    'Purchase #1029',
                    'Oct 24, 2023',
                    '+120 pts',
                  ),
                  const Divider(),
                  _buildHistoryItem(
                    'Review: Denim Jacket',
                    'Oct 22, 2023',
                    '+20 pts',
                  ),
                  const Divider(),
                  _buildHistoryItem('Daily Check-in', 'Oct 21, 2023', '+5 pts'),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCard(
    String type,
    String title,
    String action,
    String imgPath,
  ) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.lightGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    color: Color(0xFF7AA145), // accent-muted
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: AppTheme.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      action,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarnItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isHighlight = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlight
            ? AppTheme.primaryColor.withOpacity(0.1)
            : AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isHighlight
              ? AppTheme.primaryColor.withOpacity(0.3)
              : AppTheme.lightGray,
        ),
        boxShadow: isHighlight ? [] : AppTheme.shadowSm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isHighlight
                      ? AppTheme.primaryColor
                      : AppTheme.lightGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.black, size: 20),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppTheme.mediumGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: AppTheme.mediumGray),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String date, String points) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            points,
            style: const TextStyle(
              color: AppTheme
                  .primaryColor, // Ideally darker for text readability on white
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
