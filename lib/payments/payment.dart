import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int _selectedIndex = 3; // Set to 3 for 'Payments' tab

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
            _buildBalanceCard(),
            _buildMoneyTransferOptions(),
            _buildPaymentMethodsSection(),
            _buildRecentTransactionsSection(),
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

  // --- Available Balance Card ---
  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.green.shade600, // Green background
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Available Balance',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'KSh 45,670',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // --- Money Transfer Options (Send/Receive) ---
  Widget _buildMoneyTransferOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildTransferOptionCard(Icons.send, 'Send Money'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildTransferOptionCard(Icons.download, 'Receive Money'),
          ),
        ],
      ),
    );
  }

  // Helper for Transfer Option Cards
  Widget _buildTransferOptionCard(IconData icon, String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle send/receive money tap
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue.shade600, size: 30),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
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

  // --- Payment Methods Section ---
  Widget _buildPaymentMethodsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Methods',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodCard(
            icon: Icons.sim_card,
            iconColor: Colors.green,
            title: 'M-Pesa',
            number: '+254 7XX XXX XXX',
            verified: true,
          ),
          const SizedBox(height: 12),
          _buildPaymentMethodCard(
            icon: Icons.phone,
            iconColor: Colors.red,
            title: 'Airtel Money',
            number: '+254 7XX XXX XXX',
            verified: false,
          ),
        ],
      ),
    );
  }

  // Helper for Payment Method Cards
  Widget _buildPaymentMethodCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String number,
    required bool verified,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle payment method tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 24),
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
                      number,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              if (verified)
                Icon(Icons.check_circle, color: Colors.green.shade500, size: 24),
            ],
          ),
        ),
      ),
    );
  }

  // --- Recent Transactions Section ---
  Widget _buildRecentTransactionsSection() {
    final List<Map<String, dynamic>> transactions = [
      {
        'type': 'received',
        'icon': Icons.add_circle,
        'iconColor': Colors.green.shade600,
        'description': 'Payment Received',
        'details': 'From James Mwangi • Today 2:30 PM',
        'amount': '+KSh 3,500',
        'amountColor': Colors.green.shade600,
      },
      {
        'type': 'sent',
        'icon': Icons.remove_circle,
        'iconColor': Colors.red.shade600,
        'description': 'Service Payment',
        'details': 'To Sarah Njoku • Yesterday 4:15 PM',
        'amount': '-KSh 2,800',
        'amountColor': Colors.red.shade600,
      },
      {
        'type': 'completed',
        'icon': Icons.add_circle,
        'iconColor': Colors.green.shade600,
        'description': 'Job Completed',
        'details': 'Delivery Job • Yesterday 10:00 AM',
        'amount': '+KSh 1,500',
        'amountColor': Colors.green.shade600,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: transactions.map((transaction) {
              return _buildTransactionItem(
                transaction['icon'],
                transaction['iconColor'],
                transaction['description'],
                transaction['details'],
                transaction['amount'],
                transaction['amountColor'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Helper for Transaction Items
  Widget _buildTransactionItem(IconData icon, Color iconColor, String description,
      String details, String amount, Color amountColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 12,
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
    );
  }

  // --- Bottom Navigation Bar Widget (Reused from previous designs) ---

}
