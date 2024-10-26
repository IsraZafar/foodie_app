import 'package:finalhackathon/itemdetailscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DetailScreen()));
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color darkColor = Color(0xFF333333);
  static const Color greyColor = Colors.grey;
  static const Color darkButtonColor = Color(0xFF4A148C);
  static const Color whiteColor = Colors.white;

  String selectedItem = '';
  Color arrowColor = greyColor;
  bool isFavorite = false;

  void _toggleArrowColor() {
    setState(() {
      arrowColor = arrowColor == greyColor ? Colors.red : greyColor;
    });
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _selectItem(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //color: const Color.fromARGB(
        //    211, 76, 0, 130), 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
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
             
            child: Column(
              children: [
                _buildHeader(),
                _buildImageSection(),
                _buildButtonSection(),
                _buildFeaturedItemsSection(),
                _buildPromotionalItems(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _toggleArrowColor,
            child: Icon(Icons.arrow_back, color: arrowColor),
          ),
          Row(
            children: [
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.circle, size: 8, color: arrowColor),
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
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      children: [
        _buildImage('assets/images/image 18.png'),
        _buildImage('assets/images/frame 27.png'),
      ],
    );
  }

  Widget _buildImage(String assetPath) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text('Image not found', style: TextStyle(color: greyColor)),
          );
        },
      ),
    );
  }

  Widget _buildButtonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton('Delivery', darkButtonColor, Colors.white),
        _buildActionButton('Take Out', Colors.transparent, Colors.black),
        _buildActionButton('Group Order', darkColor, Colors.white),
      ],
    );
  }

  Widget _buildActionButton(String label, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }

  Widget _buildFeaturedItemsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.search, color: Colors.white),
          ),
          _buildFeaturedItem('Featured Items'),
          _buildFeaturedItem('Appetizer'),
          _buildFeaturedItem('Sushi'),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(String title) {
    return GestureDetector(
      onTap: () => _selectItem(title),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  Widget _buildPromotionalItems(double screenWidth) {
    return Column(
      children: [
        _buildPromotionalItem(
          "Udon Miso",
          "Thick Handmade Udon",
          "Noodles in a Rich Broth",
          "\$16.00",
          screenWidth,
          isLarge: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailScreen(),
              ),
            );
          },
        ),
        _buildPromotionalItem(
          "Sushi Roll",
          "Fresh Salmon Roll",
          "Delicious and Healthy",
          "\$12.00",
          screenWidth,
          isLarge: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ItemDetailScreen(//itemName: "Sushi Roll"),
                        ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPromotionalItem(String title, String subtitle1, String subtitle2,
      String price, double screenWidth,
      {bool isLarge = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isLarge ? screenWidth * 0.90 : screenWidth * 0.40,
        padding: const EdgeInsets.all(9.0),
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: darkButtonColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isLarge ? 24 : 18,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(subtitle1,
                      style: TextStyle(fontSize: 14, color: whiteColor)),
                  Text(subtitle2,
                      style: TextStyle(fontSize: 14, color: whiteColor)),
                  Text(price,
                      style: TextStyle(
                          fontSize: isLarge ? 24 : 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor)),
                ],
              ),
            ),
            if (isLarge)
              Image.asset(
                'assets/images/sourasith_udon_bowl_top_view_black_backgroundrealistic_4k_3d_mi_26a7fc49-fd5e-4b1c-a859-c4d983cd7108 1.png',
                width: 100,
                height: 100,
              ),
          ],
        ),
      ),
    );
  }
}
