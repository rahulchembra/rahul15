import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SubmitPage extends StatelessWidget {
  final XFile? imageFile;
  final String description;
  final String address;
  final String locationLink;
  final String phoneNumber;

  const SubmitPage({
    Key? key,
    required this.imageFile,
    required this.description,
    required this.address,
    required this.locationLink,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit details',
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        titleSpacing: 60.0, // Adjust the value as needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width:
                    double.infinity, // Make the width match the parent's width
                height: 400, // Increase the height as needed
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.image),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: const Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(description),
                      ),
                      ListTile(
                        title: const Text(
                          'Address & PIN Code',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(address),
                      ),
                      ListTile(
                        title: const Text(
                          'Google map location link',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(locationLink),
                      ),
                      ListTile(
                        title: const Text(
                          'Phone Number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(phoneNumber),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElevatedButton(
          onPressed: () {
            // Perform action on confirmation button press
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green), // Change button background color
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(40.0), // Change border radius
                // You can also customize other properties like border color, border width, etc.
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              'Confirm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
