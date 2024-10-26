import 'package:finalhackathon/detailscreen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color darkColor = Color(0xFF333333);
  static const Color lightPurple = Color(0xFF4A148C);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          ),
        
          
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Image
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Image.asset(
                      'assets/images/Naviagtion.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.8,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text('Image not found',
                              style: TextStyle(color: greyColor)),
                        );
                      },
                    ),
                  ),
                ),

                // Delivery Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Delivery",
                            style: TextStyle(fontSize: 16, color: greyColor)),
                        const SizedBox(height: 4),
                        Icon(Icons.delivery_dining,
                            size: 20, color: whiteColor),
                        const SizedBox(height: 4),
                        const Text(
                          "Mapliwood Suited",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.run_circle, size: 23, color: whiteColor),
                        const SizedBox(width: 4),
                        Icon(Icons.pedal_bike, size: 23, color: whiteColor),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search Box
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: greyColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Orders ?...',
                            prefixIcon: const Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.lens, color: greyColor),
                        onPressed: () {
                          // Action for Google Lens icon
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Categories Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Categories",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: whiteColor)),
                    Text("See All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: greyColor)),
                  ],
                ),

                // Images Row with Navigation
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 1; i <= 4; i++)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              "assets/images/frame $i.png",
                              width: 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text('Image not found',
                                      style: TextStyle(color: greyColor)),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Promotional Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First Promotional Container
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("30% OFF",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor)),
                                  const SizedBox(height: 4),
                                  const Text(
                                      "Discover Discounts In Your Favorite",
                                      style: TextStyle(
                                          fontSize: 14, color: whiteColor)),
                                  const Text("Local Restaurants",
                                      style: TextStyle(
                                          fontSize: 14, color: whiteColor)),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Action for the Order button
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightPurple,
                                      fixedSize: const Size(200, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    child: const Text("Order",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor)),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/cdbfc7b0b597608fa2051c7352ae71fa.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Second Promotional Container
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: lightPurple,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("20% OFF",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor)),
                                  const SizedBox(height: 4),
                                  const Text("Please Try",
                                      style: TextStyle(
                                          fontSize: 14, color: whiteColor)),
                                  const Text("Best For You",
                                      style: TextStyle(
                                          fontSize: 14, color: whiteColor)),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Action for the Order button
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF6A1B9A),
                                      fixedSize: const Size(250, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    child: const Text("Order",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/pizza.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Dots Row
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: index == 0 ? whiteColor : greyColor,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                // Text Row for "Fastest Near You"
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Fastest Near You",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Add an Image below the text
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/Card (6).png',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.settings, 'Settings'),
            _buildBottomNavItem(Icons.import_contacts, 'Browse'),
            _buildBottomNavItem(Icons.card_giftcard, 'Cards'),
            _buildBottomNavItem(Icons.shopping_cart, 'Orders'),
            _buildBottomNavItem(Icons.account_circle, 'Account'),
          ],
        ),
      ),
    );
  }

  Column _buildBottomNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: whiteColor),
          onPressed: () {
            // Action for the icon
          },
        ),
        Text(label, style: TextStyle(color: whiteColor)),
      ],
    );
  }
}
