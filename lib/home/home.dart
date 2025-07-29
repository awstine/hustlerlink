import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(context),
            _buildStatisticsSection(),
            _buildPopularCategoriesSection(),
            _buildRecentJobsSection(),
            const SizedBox(height: 20), // Padding for bottom nav bar
          ],
        ),
      ),
          );
  }

  // --- AppBar Widget ---
  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          // Logo/Brand Name
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF007BFF),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'MC',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Hutler Link',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFDF97316), // Dark grey for text
            ),
          ),
        ],
      ),
      actions: const [
        // Search Icon
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(Icons.search, color: Color(0xFF666666), size: 24),
        ),
        // Bell Icon
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.notifications, color: Color(0xFF666666), size: 24),
        ),
      ],
    );
  }

  // --- Hero Section Widget ---
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF1E40AF)], // from-blue-600 to-blue-800
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Connect. Work. Thrive.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Find opportunities, hire talent, buy & sell products, and streamline payments all in one app.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          // Grid of action cards
          GridView.count(
            shrinkWrap: true, // Use this with Column
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5, // Adjust aspect ratio for card size
            children: [
              _buildHeroCard(Icons.work, 'Find Work'),
              _buildHeroCard(Icons.people, 'Hire Talent'),
              _buildHeroCard(Icons.store, 'Marketplace'),
              _buildHeroCard(Icons.house, 'Real Estate'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for Hero Section Cards
  Widget _buildHeroCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // bg-opacity-20
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material( // Use Material for ripple effect
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Handle card tap
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Statistics Section Widget ---
  Widget _buildStatisticsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('15K+', 'Active Workers', Colors.blue.shade600),
          _buildStatItem('2.4K+', 'Active Vendors', Colors.green.shade500),
          _buildStatItem('50K+', 'Jobs Completed', Colors.orange.shade500),
        ],
      ),
    );
  }

  // Helper for Statistics Items
  Widget _buildStatItem(String count, String label, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // --- Popular Categories Section Widget ---
  Widget _buildPopularCategoriesSection() {
    final List<Map<String, dynamic>> categories = [
      {'icon': '🚚', 'name': 'Delivery', 'color': const Color(0xFFFFD700)},
      {'icon': '🧹', 'name': 'Cleaning', 'color': const Color(0xFFADD8E6)},
      {'icon': '📸', 'name': 'Photography', 'color': const Color(0xFFFF6347)},
      {'icon': '🔧', 'name': 'Plumbing', 'color': const Color(0xFF90EE90)},
      {'icon': '⚡', 'name': 'Electrical', 'color': const Color(0xFFFFC0CB)},
      {'icon': '🏗️', 'name': 'Construction', 'color': const Color(0xFFDDA0DD)},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9, // Adjust aspect ratio for card size
            children: categories.map((category) {
              return _buildCategoryCard(category['icon'], category['name'], category['color']);
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Helper for Category Cards
  Widget _buildCategoryCard(String emoji, String name, Color bgColor) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle category tap
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.2), // Lighter background for emoji
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 24), // Emoji size
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF444444),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Recent Jobs Section Widget ---
  Widget _buildRecentJobsSection() {
    final List<Map<String, dynamic>> jobs = [
      {
        'icon': Icons.local_shipping,
        'iconBgColor': Colors.blue.shade100,
        'iconColor': Colors.blue.shade600,
        'title': 'Delivery Driver',
        'company': 'QuickMart',
        'location': 'Nairobi',
        'salary': 'KSh 1,500/day',
      },
      {
        'icon': Icons.cleaning_services,
        'iconBgColor': Colors.green.shade100,
        'iconColor': Colors.green.shade600,
        'title': 'House Cleaning',
        'company': 'CleanCorp',
        'location': 'Westlands',
        'salary': 'KSh 2,000/job',
      },
      {
        'icon': Icons.camera_alt,
        'iconBgColor': Colors.purple.shade100,
        'iconColor': Colors.purple.shade600,
        'title': 'Event Photographer',
        'company': 'SnapShots Inc.',
        'location': 'CBD',
        'salary': 'KSh 3,500/event',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Jobs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle View All tap
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: jobs.map((job) {
              return _buildJobCard(
                job['icon'],
                job['iconBgColor'],
                job['iconColor'],
                job['title'],
                job['company'],
                job['location'],
                job['salary'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Helper for Job Cards
  Widget _buildJobCard(IconData icon, Color iconBgColor, Color iconColor,
      String title, String company, String location, String salary) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle job card tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$company • $location',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      salary,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Apply button tap
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // blue-600
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  elevation: 4, // Shadow
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Bottom Navigation Bar Widget ---
}
