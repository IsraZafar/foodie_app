import 'package:finalhackathon/locationorderscreen.dart';
import 'package:flutter/material.dart';

class Nextscreen extends StatefulWidget {
  const Nextscreen({super.key});

  @override
  State<Nextscreen> createState() => _NextscreenState();
}

class _NextscreenState extends State<Nextscreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color backgroundColor = Color(0xFF4A148C);
  static const Color darkPurpleBlue =
      Color(0xFF3E2A91); // Dark Purple-Blue Color
  int itemCount1 = 1;
  int itemCount2 = 1;
  int itemCount3 = 1;
  final double pricePerItem = 100.0;

  @override
  Widget build(BuildContext context) {
    double totalPrice1 = itemCount1 * pricePerItem;
    double totalPrice2 = itemCount2 * pricePerItem;
    double totalPrice3 = itemCount3 * pricePerItem;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Order Detail',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
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
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 20, 28, 140),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildOrderItem(
              'Chicken Vegi Salad',
              'assets/images/product image.png',
              itemCount1,
              totalPrice1,
              (count) {
                setState(() {
                  itemCount1 = count;
                });
              },
              () {
                setState(() {
                  itemCount1 = 0;
                });
              },
            ),
            const SizedBox(height: 16),
            buildOrderItem(
              'Mutton Curry',
              'assets/images/product image (1).png',
              itemCount2,
              totalPrice2,
              (count) {
                setState(() {
                  itemCount2 = count;
                });
              },
              () {
                setState(() {
                  itemCount2 = 0;
                });
              },
            ),
            const SizedBox(height: 16),
            buildOrderItem(
              'French Fry',
              'assets/images/product image (2).png',
              itemCount3,
              totalPrice3,
              (count) {
                setState(() {
                  itemCount3 = count;
                });
              },
              () {
                setState(() {
                  itemCount3 = 0;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildAdditionalInfo(),
            const SizedBox(height: 16),
            _buildOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget buildOrderItem(String title, String imagePath, int count,
      double totalPrice, Function(int) onCountChanged, VoidCallback onDelete) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Icon(Icons.image, color: Colors.white),
            );
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                  ),
                ],
              ),
              Text('Item Count: $count',
                  style: const TextStyle(color: Colors.white)),
              Text('Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: () {
                        if (count > 1) onCountChanged(count - 1);
                      },
                    ),
                    Text('$count', style: const TextStyle(color: Colors.white)),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        onCountChanged(count + 1);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
          const Text('Additional Information',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
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
            Text('Payment Summary',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
        const SizedBox(height: 4),
        Text('Price: \$${totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 4),
        const Text('Delivery Charges: \$0.00',
            style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 4),
        Text('Total: \$${totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, color: Colors.white)),
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
      child: const Text("Check Out",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  void _orderNow() {
    // Navigate to the confirmation screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LocationOrderScreen()),
    );
  }
}
