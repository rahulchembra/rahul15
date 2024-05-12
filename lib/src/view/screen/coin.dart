import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Coin extends StatelessWidget {
  const Coin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? currentUserUID = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My E-coins",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUID)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("No data available"),
            );
          }
          int ecoinCount = snapshot.data!['Ecoin'];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your E-Coins',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total E-Coins',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          ecoinCount.toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement redeeming functionality
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(86, 115, 13, 67)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Text('Redeem'), // Removed const from here
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Ways to earn',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Shop on Erevive app'),
                  subtitle: Text('Earn E-Coins for every order'),
                  onTap: () {
                    // Implement navigation to shop page
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Sell on Erevive app'),
                  subtitle: Text('Earn E-Coins for every sell'),
                  onTap: () {
                    // Implement navigation to review page
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
