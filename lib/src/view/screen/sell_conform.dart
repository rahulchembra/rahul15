import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erevive/src/view/screen/sell_success.dart';

class SubmitPage extends StatefulWidget {
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
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  late FirebaseStorage _storage;
  late FirebaseFirestore _firestore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Save references to FirebaseStorage and FirebaseFirestore instances
    _storage = FirebaseStorage.instance;
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit details',
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        titleSpacing: 60.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 400,
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
                      child: widget.imageFile != null
                          ? Image.file(
                              File(widget.imageFile!.path),
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
                        subtitle: Text(widget.description),
                      ),
                      ListTile(
                        title: const Text(
                          'Address & PIN Code',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(widget.address),
                      ),
                      ListTile(
                        title: const Text(
                          'Google map location link',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(widget.locationLink),
                      ),
                      ListTile(
                        title: const Text(
                          'Phone Number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(widget.phoneNumber),
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
          onPressed: () async {
            try {
              if (widget.imageFile != null) {
                var storageRef =
                    _storage.ref().child('images/${DateTime.now().toString()}');
                await storageRef.putFile(File(widget.imageFile!.path));
                var imageUrl = await storageRef.getDownloadURL();
                var user = FirebaseAuth.instance.currentUser;
                var uid = user?.uid;
                await _firestore.collection('submissions').add({
                  'image_url': imageUrl,
                  'description': widget.description,
                  'address': widget.address,
                  'location_link': widget.locationLink,
                  'phone_number': widget.phoneNumber,
                  'user_uid': uid,
                });
                // Navigate to another page after successful submission
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SellSucess()),
                );
              } else {
                // Handle case when no image is selected
              }
            } catch (e) {
              print('Firebase Storage Error: $e');
              // Handle Firebase Storage error accordingly
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
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
