import 'package:flutter/material.dart';

class Road extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50.0), // Adjust padding as needed
          child: Text(
            'Product list',
            style: TextStyle(
              fontSize: 22, // Adjust font size if needed
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0), // SizedBox below the AppBar
          Expanded(
            child: ListView(
              children: <Widget>[
                DetailsCard(
                  image: 'assets/ewaste.png',
                  text1: 'Product 1',
                  text2: 'Description 1',
                ),
                DetailsCard(
                  image: 'assets/ewaste.png',
                  text1: 'Product 2',
                  text2: 'Description 2',
                ),
                DetailsCard(
                  image: 'assets/img14.png',
                  text1: 'Product 3',
                  text2: 'Description 3',
                ),
                // Add more DetailsCard widgets for additional items
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;

  DetailsCard({required this.image, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0), // Added horizontal padding
      elevation: 3.0,
      child: SizedBox(
        height: 160.0, // Adjust the height of the card here
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 60.0, // Adjust the size of the circle avatar here
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage(image), // Image for circle avatar
              ),
            ),
            SizedBox(
                width: 15.0), // Added padding between circle avatar and text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text1), // Text 1
                  SizedBox(height: 5.0), // Added gap between text fields
                  Text(text2), // Text 2
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
