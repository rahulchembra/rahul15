import 'package:flutter/material.dart';
import 'package:erevive/src/view/screen/place_order.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 70.0), // Adjust padding as needed
          child: Text(
            'Payment',
            style: TextStyle(
              fontSize: 22, // Adjust font size if needed
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Select Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildPaymentOption(
                  icon: Icons.account_balance_wallet,
                  title: 'Cash on Delivery',
                  onTap: () {
                    // Implement cash on delivery payment logic
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Placeorder()));
                  },
                ),
                const SizedBox(height: 25),
                _buildPaymentOption(
                  icon: Icons.monetization_on,
                  title: 'Pay using E-coins',
                  onTap: () {
                    // Implement Ecoins payment logic
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/card-payment.png',
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
