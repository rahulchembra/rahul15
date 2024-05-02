import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Ecoins",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Your ECoins',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total ECoins',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '500', // Example: Total SuperCoins count
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement redeeming functionality
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(
                            86, 115, 13, 67)), // Background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Text color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            18.0), // Set your desired border radius here
                      ),
                    ),
                  ),
                  child: const Text('Redeem'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Ways to earn',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Shop on E REVIVE app'),
              subtitle: const Text('Earn ECoins for every order'),
              onTap: () {
                // Implement navigation to shop page
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Rate & Review Products'),
              subtitle: const Text('Earn ECoins per review'),
              onTap: () {
                // Implement navigation to review page
              },
            ),
            // Add more ways to earn SuperCoins as needed
          ],
        ),
      ),
    );
  }
}
