import 'package:flutter/material.dart';

class Lastscreen extends StatefulWidget {
  const Lastscreen({super.key});

  @override
  State<Lastscreen> createState() => _LastscreenState();
}

class _LastscreenState extends State<Lastscreen> {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color backgroundColor = Color(0xFF4A148C);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color darkPurpleBlue = Color(0xFF311B92);

  final List<Map<String, String>> deliveryStatus = [
    {'time': '04:30pm', 'status': 'Confirmed'},
    {'time': '04:38pm', 'status': 'Processing'},
    {'time': '04:42pm', 'status': 'On the way'},
    {'time': '04:46pm', 'status': 'Delivered'},
  ];

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
          'Track Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderInfo(),
            const SizedBox(height: 8.0),
            _buildDeliveryStatusList(),
            const SizedBox(height: 8.0), // Space before additional info
            _buildAdditionalInfo(),
            const SizedBox(height: 8.0), // Space before order button
            _buildOrderButton(),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }

  Widget _buildOrderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Order ID: 6456554544545', style: TextStyle(color: whiteColor)),
        Text('Today', style: TextStyle(color: whiteColor)),
      ],
    );
  }

  Widget _buildDeliveryStatusList() {
    return Expanded(
      child: ListView.builder(
        itemCount: deliveryStatus.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(deliveryStatus[index]['status']!,
                    style: TextStyle(color: whiteColor)),
                Text(deliveryStatus[index]['time']!,
                    style: TextStyle(color: greyColor)),
              ],
            ),
          );
        },
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
          const Text('Mr. Kamplas',
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
    return Row(
      children: const [
        Icon(Icons.person_2_outlined, color: Colors.white, size: 50),
        SizedBox(width: 8),
        Text('25 min left',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ],
    );
  }

  Widget _buildOrderButton() {
    return ElevatedButton(
      onPressed: _orderNow,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5E35B1),
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Check Box",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  void _orderNow() {
    // Action when the button is pressed, e.g., navigate to another screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
  }
}
