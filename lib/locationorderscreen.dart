import 'package:finalhackathon/lastscreen.dart';
import 'package:flutter/material.dart';

class LocationOrderScreen extends StatefulWidget {
  const LocationOrderScreen({super.key});

  @override
  State<LocationOrderScreen> createState() => _LocationOrderScreenState();
}

class _LocationOrderScreenState extends State<LocationOrderScreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color backgroundColor = Color(0xFF4A148C);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color darkPurpleBlue =
      Color(0xFF3E2A91); // Dark Purple-Blue Color

  final int itemCount1 = 1;
  final int itemCount2 = 2;
  final int itemCount3 = 1;
  final double pricePerItem = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Find Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9B), // Lighter Purple-Blue
              Color(0xFF333334), // Dark grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildSearchBox(),
              const SizedBox(height: 20), // Space between search box and image
              Center(
                child: Image.asset(
                  'assets/images/frame 109.png', // Replace with your image path
                  width: 450,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 450,
                      height: 250,
                      color: greyColor,
                      child: const Icon(Icons.error, color: Colors.white),
                    );
                  },
                ),
              ),
              const SizedBox(
                  height: 20), // Space between image and additional info
              _buildAdditionalInfo(),
              const SizedBox(height: 20), // Space before button
              Center(child: _buildOrderButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6A1B9B), // Lighter Purple-Blue
            Color(0xFF333334), // Dark grey
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: greyColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find Your Location...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: darkPurpleBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Location',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          _buildPaymentSummary(),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    double totalAmount = (itemCount1 + itemCount2 + itemCount3) * pricePerItem;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.payment, color: Colors.blue, size: 24),
            SizedBox(width: 8),
            Text(
              'Manchester, Cenkucy 39437',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderButton() {
    return ElevatedButton(
      onPressed: _orderNow,
      style: ElevatedButton.styleFrom(
       backgroundColor:
                            const Color(0xFF5E35B1),
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        "Set Location",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _orderNow() {
    // Navigate to the confirmation screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Lastscreen()),
    );
  }
}
