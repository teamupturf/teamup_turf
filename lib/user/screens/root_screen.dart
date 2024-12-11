import 'package:flutter/material.dart';
import 'package:teamup_turf/user/screens/chat_select_screen.dart';
import 'package:teamup_turf/user/screens/home_screen.dart';
import 'package:teamup_turf/user/screens/messages_screen.dart';
import 'package:teamup_turf/user/screens/news_screen.dart';
import 'package:teamup_turf/user/screens/profile.dart';
import 'package:teamup_turf/user/screens/profile_view_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Screens for each BottomNavigationBarItem
  final List<Widget> _screens = [
    HomeScreen(),
    ProfileViewScreen(),
    Scaffold(), // Placeholder for the Spot screen
    UserSelectionScreen(), // Placeholder for the Messages screen
    NewsScreen(), // Placeholder for the News screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          // Customized Bottom Navigation Items
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: 'Home',
            backgroundColor: Colors.teal.shade50,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.teal),
            label: 'Profile',
            backgroundColor: Colors.teal.shade50,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place, color: Colors.teal),
            label: 'Spot',
            backgroundColor: Colors.teal.shade50,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.teal),
            label: 'Messages',
            backgroundColor: Colors.teal.shade50,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.teal),
            label: 'News',
            backgroundColor: Colors.teal.shade50,
          ),
        ],
      ),
      // AppBar with gradient and title
     
    );
  }
}
