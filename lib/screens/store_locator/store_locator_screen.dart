import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'store_detail_screen.dart';

class StoreLocatorScreen extends StatelessWidget {
  static const routeName = '/store-locator';

  const StoreLocatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/mock_map.png',
                ), // Placeholder for map
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Colors.black.withOpacity(0.15), Colors.transparent],
                ),
              ),
            ),
          ),

          // Map Pins (Simulated)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.4,
            child: _buildMapPin(context, true),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.6,
            child: _buildMapPin(context, false),
          ),
          // User Location Pin
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            left: MediaQuery.of(context).size.width * 0.55,
            child: _buildUserPin(),
          ),

          // Header / Search Area
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        padding: const EdgeInsets.only(left: 6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search by city or zip',
                            hintStyle: const TextStyle(
                              color: AppTheme.mediumGray,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppTheme.mediumGray,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            filled: false,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: AppTheme.black),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Handle
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: 48,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Stores Near You',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '3 STORES FOUND',
                                style: TextStyle(
                                  color: AppTheme.mediumGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'View List',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // List
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildSelectedStoreCard(context),
                          const SizedBox(height: 16),
                          _buildStoreCard(
                            context,
                            'Trendsetter Soho',
                            'OPEN',
                            '1.5 miles • 456 Broadway',
                            '4.8',
                            '10am - 8pm',
                          ),
                          const SizedBox(height: 16),
                          _buildStoreCard(
                            context,
                            'Vibe Studio East',
                            'CLOSED',
                            '3.2 miles • 789 5th Ave',
                            '4.5',
                            'Opens 11am Mon',
                            isClosed: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMapPin(BuildContext context, bool isTarget) {
    return Column(
      children: [
        Container(
          width: isTarget ? 40 : 32,
          height: isTarget ? 40 : 32,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.shopping_bag,
            color: AppTheme.black,
            size: isTarget ? 20 : 16,
          ),
        ),
        Container(width: 4, height: 8, color: Colors.white),
      ],
    );
  }

  Widget _buildUserPin() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
    );
  }

  Widget _buildSelectedStoreCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(StoreDetailScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.5),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'OPEN NOW',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              '•',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Text(
                            'Closes 9:00 PM',
                            style: TextStyle(
                              color: AppTheme.mediumGray,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Fashion Hub Downtown',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '1.2 miles • 123 Main St, NY 10001',
                        style: TextStyle(
                          color: AppTheme.mediumGray,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/store_front.png',
                      ), // Placeholder
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.directions),
                    label: const Text('Directions'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: AppTheme.black,
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreCard(
    BuildContext context,
    String name,
    String status,
    String address,
    String rating,
    String hours, {
    bool isClosed = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.shadowSm,
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/placeholder_store.png',
                ), // Placeholder
                fit: BoxFit.cover,
              ),
              color: Colors.grey[100],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isClosed ? Colors.grey : AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(color: AppTheme.mediumGray, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.orange[400]),
                    Text(
                      ' $rating',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.schedule, size: 14, color: Colors.grey),
                    Text(
                      ' $hours',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
