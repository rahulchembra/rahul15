import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Road extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 45.0), // Adjust padding as needed
          child: Text(
            'Product Details',
            style: TextStyle(
              fontSize: 22, // Adjust font size if needed
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('submissions').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var submission = documents[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120, // Width of the container
                            height: 130, // Height of the container
                            constraints: BoxConstraints(
                                minHeight: 100), // Ensure minimum height
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    submission['image_url']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 20), // Add spacing between image and text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4), // Add spacing
                                Text(submission['description']),
                                SizedBox(height: 4), // Add spacing
                                Text(submission['address']),
                                SizedBox(height: 4), // Add spacing
                                Text(submission['location_link']),
                                SizedBox(height: 4), // Add spacing
                                Text(submission['phone_number']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
