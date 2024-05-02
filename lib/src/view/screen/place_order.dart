import 'package:flutter/material.dart';
import 'package:erevive/src/view/screen/order_sucess.dart';

class Placeorder extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delivery Address',
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        titleSpacing: 60.0, // Adjust the value as needed
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top order details
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Order Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Small widget box for order details
                  Container(
                    height: 150, // adjust height according to your need
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Add your order details widget here
                    child: const Center(
                      child: Text('Order Details Widget'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Text "Enter delivery details"
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Enter Delivery Details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Delivery details form
                  TextField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: addressController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'City/Town',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cityController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Googlemap location link',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: postalCodeController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Pin Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: phoneNumberController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          // "Place Order" button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OrderSucess())); // Add functionality to place order button
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                backgroundColor:
                    Color.fromARGB(61, 78, 11, 34), // Background color
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
