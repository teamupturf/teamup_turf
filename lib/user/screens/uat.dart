import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'TeamUp Turf',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choose Your Role to Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Role Selection Section
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the cards vertically
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center the cards horizontally
                  children: [
                    _buildRoleCard(
                      context: context,
                      title: 'User',
                      description: 'Book turfs and join teams effortlessly.',
                      icon: Icons.person,
                      color: Colors.green,
                      onPressed: () {
                        // Handle navigation for User
                        Navigator.pushNamed(context, '/userHome');
                      },
                    ),
                    SizedBox(height: 20), // Space between cards
                    _buildRoleCard(
                      context: context,
                      title: 'Admin',
                      description: 'Manage platform data and operations.',
                      icon: Icons.admin_panel_settings,
                      color: Colors.orange,
                      onPressed: () {
                        // Handle navigation for Admin
                        Navigator.pushNamed(context, '/adminHome');
                      },
                    ),
                    SizedBox(height: 20), // Space between cards
                    _buildRoleCard(
                      context: context,
                      title: 'Turf Manager',
                      description: 'Manage bookings and list turfs.',
                      icon: Icons.sports_soccer,
                      color: Colors.purple,
                      onPressed: () {
                        // Handle navigation for Turf Manager
                        Navigator.pushNamed(context, '/turfHome');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                radius: 35,
                child: Icon(icon, size: 40, color: color),
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
