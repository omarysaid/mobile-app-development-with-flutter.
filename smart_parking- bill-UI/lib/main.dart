import 'package:flutter/material.dart';
// import 'package:user_control/users/login.dart';
// import 'package:user_control/users/register.dart';
import 'package:user_control/users/image.dart';
//import 'resource/bottom_nav_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      home: UserControl(),
      debugShowCheckedModeBanner: false, // Set this to false
    ),
  );
}

class UserControl extends StatefulWidget {
  const UserControl({Key? key}) : super(key: key);

  @override
  _UserControlState createState() => _UserControlState();
}

class _UserControlState extends State<UserControl> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: const Text('Welcome Home'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserImage()),
              );
              print('image picker button pressed');
            },
            child: const Text(
              'Photo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const UserRegistration()),
          //     );
          //     print('Register button pressed');
          //   },
          //   child: const Text(
          //     'Register',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const UserLogin()),
          //     );
          //   },
          //   child: const Text(
          //     'Login',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Community'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text('Welcome home'),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   // Handle navigation based on the selected index
  //   switch (index) {
  //     case 0:
  //       // Navigate to home
  //       print('to home');
  //       break;
  //     case 1:
  //       // Navigate to notifications
  //       print('to notification');
  //       break;
  //     case 2:
  //       // Navigate to profile
  //       print('to profile');
  //       break;
  //   }
  //}
}
