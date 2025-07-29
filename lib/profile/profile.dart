import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Set to 4 for 'Profile' tab
  String _selectedGigFilter = 'Active'; // 'Active' or 'Completed'

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // In a real app, you would navigate to different screens here
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
            _buildProfileHeader(),
            _buildStatisticsSection(),
            _buildMyGigsSection(),
            const SizedBox(height: 20), // Padding for bottom nav bar
          ],
        ),
      ),
    );
  }

  // --- AppBar Widget (Reused from previous designs) ---
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
            'Hustler Link',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFDF97316), // Dark grey for text
            ),
          ),
        ],
      ),
      actions: const [
        // Chat Icon
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(Icons.chat_bubble_outline, color: Color(0xFF666666), size: 24),
        ),
        // Search Icon
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.search, color: Color(0xFF666666), size: 24),
        ),
      ],
    );
  }

  // --- Profile Header Section ---
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Picture
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade600, width: 3),
              image: const DecorationImage(
                image: NetworkImage('https://placehold.co/100x100/CCCCCC/000000?text=Profile'), // Placeholder image
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // User Name
          const Text(
            'Michael Ochieng',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          // Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_border, // 4.8 rating, so 4 full stars
                color: Colors.amber,
                size: 20,
              );
            })
              ..add(const SizedBox(width: 8))
              ..add(const Text(
                '4.8 Rating',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              )),
          ),
        ],
      ),
    );
  }

  // --- Statistics Section ---
  Widget _buildStatisticsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: _buildStatCard('47', 'Total Jobs', Colors.blue.shade600)),
          const SizedBox(width: 12),
          Expanded(child: _buildStatCard('125K', 'Earnings (KSh)', Colors.green.shade600)),
          const SizedBox(width: 12),
          Expanded(child: _buildStatCard('4.8', 'Rating', Colors.orange.shade600)),
        ],
      ),
    );
  }

  // Helper for Statistics Cards
  Widget _buildStatCard(String value, String label, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- My Gigs Section ---
  Widget _buildMyGigsSection() {
    final List<Map<String, dynamic>> activeGigs = [
      {
        'icon': Icons.build,
        'iconBgColor': Colors.orange.shade100,
        'iconColor': Colors.orange.shade600,
        'title': 'Plumbing Repair',
        'status': 'Active',
        'date': 'Due Dec 20, 2024',
        'amount': 'KSh 3,500',
        'amountColor': Colors.green.shade600,
      },
      {
        'icon': Icons.local_shipping,
        'iconBgColor': Colors.blue.shade100,
        'iconColor': Colors.blue.shade600,
        'title': 'Delivery Service',
        'status': 'Active',
        'date': 'Due Dec 22, 2024',
        'amount': 'KSh 1,500',
        'amountColor': Colors.green.shade600,
      },
    ];

    final List<Map<String, dynamic>> completedGigs = [
      {
        'icon': Icons.build,
        'iconBgColor': Colors.orange.shade100,
        'iconColor': Colors.orange.shade600,
        'title': 'Plumbing Repair',
        'status': 'Completed',
        'date': 'Completed • Dec 15, 2024',
        'amount': 'KSh 3,500',
        'amountColor': Colors.green.shade600,
      },
      {
        'icon': Icons.local_shipping,
        'iconBgColor': Colors.blue.shade100,
        'iconColor': Colors.blue.shade600,
        'title': 'Delivery Service',
        'status': 'Completed',
        'date': 'Completed • Dec 12, 2024',
        'amount': 'KSh 1,500',
        'amountColor': Colors.green.shade600,
      },
      {
        'icon': Icons.cleaning_services,
        'iconBgColor': Colors.green.shade100,
        'iconColor': Colors.green.shade600,
        'title': 'House Cleaning',
        'status': 'Completed',
        'date': 'Completed • Dec 10, 2024',
        'amount': 'KSh 2,000',
        'amountColor': Colors.green.shade600,
      },
    ];

    List<Map<String, dynamic>> currentGigs = _selectedGigFilter == 'Active' ? activeGigs : completedGigs;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Gigs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          // Filter buttons
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFilterButton('Active', _selectedGigFilter == 'Active'),
                _buildFilterButton('Completed', _selectedGigFilter == 'Completed'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // List of gigs
          Column(
            children: currentGigs.map((gig) {
              return _buildGigItem(
                gig['icon'],
                gig['iconBgColor'],
                gig['iconColor'],
                gig['title'],
                gig['date'],
                gig['amount'],
                gig['amountColor'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Helper for Filter Buttons
  Widget _buildFilterButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGigFilter = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade600 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Helper for Gig Items
  Widget _buildGigItem(IconData icon, Color iconBgColor, Color iconColor,
      String title, String date, String amount, Color amountColor) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle gig item tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      date,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: amountColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Bottom Navigation Bar Widget (Reused from previous designs) ---
}
