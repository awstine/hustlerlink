import 'package:flutter/material.dart';


class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  int _selectedIndex = 2; // Set to 2 for 'Market' tab

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
            _buildCategoriesSection(),
            _buildFeaturedProductsSection(),
            _buildCustomRequestsSection(),
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

  // --- Search Bar Widget (Modified for products) ---
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
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

  // --- Categories Section Widget ---
  Widget _buildCategoriesSection() {
    final List<Map<String, dynamic>> categories = [
      {'image': 'https://placehold.co/60x60/ADD8E6/ffffff?text=💻', 'name': 'Electronics'},
      {'image': 'https://placehold.co/60x60/FFC0CB/ffffff?text=👕', 'name': 'Clothing'},
      {'image': 'https://placehold.co/60x60/90EE90/ffffff?text=🍎', 'name': 'Food'},
      // Add more categories as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120, // Fixed height for horizontal scroll
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(
                  categories[index]['image'],
                  categories[index]['name'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Category Cards
  Widget _buildCategoryCard(String imageUrl, String name) {
    return Container(
      width: 100, // Fixed width for each category card
      margin: const EdgeInsets.only(right: 12),
      child: Card(
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
                Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 40, color: Colors.grey), // Fallback
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
      ),
    );
  }

  // --- Featured Products Section ---
  Widget _buildFeaturedProductsSection() {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'https://placehold.co/150x150/000000/ffffff?text=Samsung+A15',
        'name': 'Samsung Galaxy A15',
        'seller': 'TechZone Nairobi',
        'price': 'KSh 22,000',
        'rating': 4.2,
      },
      {
        'image': 'https://placehold.co/150x150/888888/ffffff?text=Casual+Shirt',
        'name': 'Casual Shirt',
        'seller': 'FashionHub Karen',
        'price': 'KSh 1,800',
        'rating': 4.8,
      },
      {
        'image': 'https://placehold.co/150x150/FFD700/000000?text=Gaming+Headset',
        'name': 'Gaming Headset',
        'seller': 'GameOn Store',
        'price': 'KSh 4,500',
        'rating': 4.5,
      },
      {
        'image': 'https://placehold.co/150x150/008000/ffffff?text=Organic+Vegetables',
        'name': 'Organic Vegetables',
        'seller': 'GreenHarvest Farm',
        'price': 'KSh 800/kg',
        'rating': 4.9,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7, // Adjust to fit content
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _buildProductCard(
                products[index]['image'],
                products[index]['name'],
                products[index]['seller'],
                products[index]['price'],
                products[index]['rating'],
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper for Product Cards
  Widget _buildProductCard(String imageUrl, String name, String seller, String price, double rating) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle product tap
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 80, color: Colors.grey), // Fallback
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    seller,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.green.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade600, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
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
          ],
        ),
      ),
    );
  }

  // --- Custom Requests Section ---
  Widget _buildCustomRequestsSection() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF1E40AF)], // blue-600 to blue-800
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Custom Requests:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Can't find what you're looking for?\nRequest it!",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                const Text(
                  '2,400+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Active Requests',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Handle Make Custom Request button tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    elevation: 5,
                  ),
                  child: Text(
                    'Make Custom Request',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  // --- Bottom Navigation Bar Widget (Reused from previous designs) ---
}
