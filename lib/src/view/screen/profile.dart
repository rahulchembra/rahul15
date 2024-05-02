import 'package:flutter/material.dart';
import 'package:erevive/src/view/screen/coin.dart';
import 'package:erevive/login/loginpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Implement back button functionality here
            },
          ),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          // You can customize the AppBar further if needed
        ),
        body: Container(
          color: Colors.white54,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/profile_pic.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Allu Arjun",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("@tollywood")],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Manage your profile\n            here",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to My Ecoins page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Coin()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          bottom: 10,
                        ),
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.paid,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'My Ecoins',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Purchase History page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Coin()),
                        );
                      },
                      child: Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          bottom: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.history,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Purchase History',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Help & Support page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Coin()),
                        );
                      },
                      child: Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          bottom: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.help_outline,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Help & Support',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Logout page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          bottom: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
