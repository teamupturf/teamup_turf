import 'package:flutter/material.dart';
import 'package:teamup_turf/user/screens/home_screen.dart';
import 'package:teamup_turf/user/screens/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Screens for each BottomNavigationBarItem
  final List<Widget> _screens = [
    HomeScreen(),
   ProfileScreen(),
      Scaffold(),
     Scaffold(),
      Scaffold(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Spot',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'News',
          ),
        ],
      ),
    );
  }
}
