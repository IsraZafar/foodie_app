import 'package:finalhackathon/nextscreen.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color greyColor = Colors.grey;
  int itemCount = 1; // Initial item count
  bool isFavorite = false;

  // Checkbox states
  Map<String, bool> noodleTypes = {
    'Thin': false,
    'Thick': false,
    'Udon': false,
    'Shirataki': false,
  };

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double pricePerUnit = 4.99; // Price per unit
    double totalPrice = pricePerUnit * itemCount; // Calculate total price

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Item Detail'),
      ),
      body: Container(
        color: const Color.fromARGB(230, 66, 0, 180), // Background color
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6A1B9B), // Lighter Purple-Blue
                    Color(0xFF333334), // Dark grey
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Colors.black87, // Inner box color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("assets/images/image 17 (1).png"),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Undo Mico',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : greyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const VerticalDivider(thickness: 2, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Price: 1 kg',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        onPressed: _decrementCount,
                        child: const Text(
                          '-',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '$itemCount',
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        onPressed: _incrementCount,
                        child: const Text(
                          '+',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2, color: Colors.grey),
                  const Text(
                    'Product Detail',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Our Udon Miso is a comforting bowl of thick, handmade udon noodles in a rich miso broth, garnished with tofu, spring onions, and vegetables.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Noodle Type',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle required action
                        },
                        child: const Text(
                          'Required',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: noodleTypes.entries.map((entry) {
                      return CheckboxListTile(
                        title: Text(entry.key,
                            style: const TextStyle(color: Colors.white)),
                        value: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            noodleTypes[entry.key] = value ?? false;
                          });
                        },
                        activeColor: primaryColor,
                      );
                    }).toList(),
                  ),
                  // Add to Basket Button
                  SizedBox(
                    width: double.infinity, // Make the button full-width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF5E35B1), // Blue-purple color
                        padding: const EdgeInsets.symmetric(
                            vertical: 16), // Vertical padding
                      ),
                      onPressed: () {
                        // Navigate to the desired screen when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Nextscreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Add to Basket',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // White text
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
