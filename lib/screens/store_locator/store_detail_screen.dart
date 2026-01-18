import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StoreDetailScreen extends StatelessWidget {
  static const routeName = '/store-detail';

  const StoreDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero AppBar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/store_front.png', // Placeholder
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Card
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fashion Hub Downtown',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '123 Fashion Ave, Downtown District',
                                style: TextStyle(
                                  color: AppTheme.mediumGray,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Open'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Operating Hours Accordion (Simplified)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.lightGray),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ExpansionTile(
                        shape: Border.all(color: Colors.transparent),
                        leading: const Icon(
                          Icons.schedule,
                          color: AppTheme.mediumGray,
                        ),
                        title: Text(
                          'Today: 10:00 AM - 9:00 PM',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                        ),
                        childrenPadding: const EdgeInsets.fromLTRB(
                          16,
                          0,
                          16,
                          16,
                        ),
                        children: [
                          _buildHourRow(
                            context,
                            'Mon - Fri',
                            '10:00 AM - 9:00 PM',
                          ),
                          _buildHourRow(
                            context,
                            'Saturday',
                            '10:00 AM - 10:00 PM',
                            isHighlight: true,
                          ),
                          _buildHourRow(
                            context,
                            'Sunday',
                            '11:00 AM - 7:00 PM',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Inventory Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending in Stock',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 260,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildProductCard(
                            context,
                            'Oversized Denim',
                            '\$129.00',
                            'assets/images/products/jackets/jacket_1.jpg',
                          ),
                          _buildProductCard(
                            context,
                            'Neon Mesh Tee',
                            '\$45.00',
                            'assets/images/products/dresses/dress_1.jpg',
                          ),
                          _buildProductCard(
                            context,
                            'Vibe Sneakers',
                            '\$190.00',
                            'assets/images/products/jackets/jacket_2.jpg',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 80), // Space for fixed bottom bar
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: AppTheme.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Get Directions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text('Call Store'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppTheme.lightGray),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHourRow(
    BuildContext context,
    String day,
    String time, {
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(color: AppTheme.mediumGray, fontSize: 13),
          ),
          Text(
            time,
            style: TextStyle(
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight
                  ? AppTheme.primaryColor
                  : Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String title,
    String price,
    String imgPath,
  ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.lightGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(11),
              ),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  radius: 14,
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: AppTheme.mediumGray,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.color,
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Check Size',
                      style: TextStyle(
                        fontSize: 10,
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
}
