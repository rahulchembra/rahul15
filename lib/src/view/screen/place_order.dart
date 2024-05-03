import 'package:flutter/material.dart';
import 'package:erevive/src/view/screen/order_sucess.dart';

class Placeorder extends StatefulWidget {
  @override
  _PlaceorderState createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool submitted = false;

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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Enter Delivery Details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Delivery details form
                  buildTextField(
                    controller: descriptionController,
                    labelText: 'State',
                    errorText: submitted && descriptionController.text.isEmpty
                        ? 'This field is mandatory'
                        : null,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: addressController,
                    labelText: 'City/Town',
                    errorText: submitted && addressController.text.isEmpty
                        ? 'This field is mandatory'
                        : null,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: cityController,
                    labelText: 'Googlemap location link',
                    errorText: submitted && cityController.text.isEmpty
                        ? 'This field is mandatory'
                        : null,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: postalCodeController,
                    labelText: 'Pin Code',
                    errorText: submitted && postalCodeController.text.isEmpty
                        ? 'This field is mandatory'
                        : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: phoneNumberController,
                    labelText: 'Phone Number',
                    errorText: submitted && phoneNumberController.text.isEmpty
                        ? 'This field is mandatory'
                        : null,
                    keyboardType:
                        TextInputType.number, // Set keyboardType to number
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
                setState(() {
                  submitted = true;
                });
                if (descriptionController.text.isNotEmpty &&
                    addressController.text.isNotEmpty &&
                    cityController.text.isNotEmpty &&
                    postalCodeController.text.isNotEmpty &&
                    phoneNumberController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSucess()),
                  );
                }
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

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        errorText: errorText,
      ),
      keyboardType: keyboardType,
    );
  }
}
