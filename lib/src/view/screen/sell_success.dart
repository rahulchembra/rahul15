import 'package:flutter/material.dart';
import 'package:erevive/src/view/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellSucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 210, 239, 239), // Set background color to match card background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 110.0),
              Card(
                elevation: 5.0,
                color: const Color.fromARGB(
                    218, 76, 232, 221), // Set card background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/secure-shield.png', // Replace this with your image asset
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Your sell E-waste has been successful!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () async {
                          String? currentUserUID =
                              FirebaseAuth.instance.currentUser?.uid;
                          try {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(currentUserUID)
                                .update({'Ecoin': FieldValue.increment(20)});
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } catch (e) {
                            print("Error updating ecoin count: $e");
                            // Handle error
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15.0),
                          ),
                        ),
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
