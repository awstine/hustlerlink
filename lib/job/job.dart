import 'package:flutter/material.dart';


class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  int _selectedIndex = 1; // Set to 1 for 'Jobs' tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // In a real app, you would navigate to different screens here
      // For example:
      // if (index == 0) {
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // }
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
            _buildSearchBar(),
            _buildFilterChips(),
            _buildJobList(),
            const SizedBox(height: 20), // Padding for bottom nav bar
          ],
        ),
      ),
    );
  }

  // --- AppBar Widget (Reused from previous design) ---
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
            'Huster Link',
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

  // --- Search Bar Widget ---
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for jobs...',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // No border
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade600, width: 1.5),
          ),
        ),
      ),
    );
  }

  // --- Filter Chips Widget ---
  Widget _buildFilterChips() {
    final List<String> filters = [
      'All Jobs',
      'Delivery',
      'Cleaning',
      'Photography',
      'Plumbing',
      'Electrical',
      'Construction'
    ];
    return Container(
      height: 40, // Fixed height for the scrollable row
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0; // 'All Jobs' is selected by default
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(filters[index]),
              selected: isSelected,
              selectedColor: Colors.blue.shade600,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSelected ? Colors.blue.shade600 : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              onSelected: (selected) {
                // Handle filter selection
                // In a real app, this would update the job list
              },
            ),
          );
        },
      ),
    );
  }

  // --- Job List Widget ---
  Widget _buildJobList() {
    final List<Map<String, dynamic>> jobs = [
      {
        'icon': Icons.local_shipping,
        'iconBgColor': Colors.blue.shade100,
        'iconColor': Colors.blue.shade600,
        'title': 'Delivery Driver',
        'company': 'QuickMart',
        'location': 'Nairobi CBD',
        'salary': 'KSh 1,500/day',
        'type': 'Full-time',
        'posted': 'Posted 2h ago',
      },
      {
        'icon': Icons.cleaning_services,
        'iconBgColor': Colors.green.shade100,
        'iconColor': Colors.green.shade600,
        'title': 'Office Cleaning',
        'company': 'CleanPro Services',
        'location': 'Westlands',
        'salary': 'KSh 2,500/job',
        'type': 'Part-time',
        'posted': 'Posted 4h ago',
      },
      {
        'icon': Icons.camera_alt,
        'iconBgColor': Colors.purple.shade100,
        'iconColor': Colors.purple.shade600,
        'title': 'Event Photography',
        'company': 'EventPro',
        'location': 'Karen',
        'salary': 'KSh 5,000/event',
        'type': 'Contract',
        'posted': 'Posted 6h ago',
      },
      {
        'icon': Icons.plumbing,
        'iconBgColor': Colors.orange.shade100,
        'iconColor': Colors.orange.shade600,
        'title': 'Plumbing Repair',
        'company': 'Flatt Solutions',
        'location': 'Kileleshwa',
        'salary': 'KSh 3,500/job',
        'type': 'Urgent',
        'posted': 'Posted 1h ago',
      },
      {
        'icon': Icons.electrical_services,
        'iconBgColor': Colors.red.shade100,
        'iconColor': Colors.red.shade600,
        'title': 'Electrical Technician',
        'company': 'PowerGrid Ltd.',
        'location': 'Industrial Area',
        'salary': 'KSh 4,000/day',
        'type': 'Full-time',
        'posted': 'Posted 1d ago',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: jobs.map((job) {
          return _buildJobCard(
            job['icon'],
            job['iconBgColor'],
            job['iconColor'],
            job['title'],
            job['company'],
            job['location'],
            job['salary'],
            job['type'],
            job['posted'],
          );
        }).toList(),
      ),
    );
  }

  // Helper for Job Cards (Extended to include type and posted time)
  Widget _buildJobCard(
      IconData icon,
      Color iconBgColor,
      Color iconColor,
      String title,
      String company,
      String location,
      String salary,
      String type,
      String posted) {
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          type,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle, size: 4, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          posted,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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

  // --- Bottom Navigation Bar Widget (Reused from previous design) ---
}
