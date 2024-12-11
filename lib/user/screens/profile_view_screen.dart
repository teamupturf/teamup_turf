import 'package:flutter/material.dart';

class ProfileViewScreen extends StatelessWidget {
  final String profilePicture = 'https://via.placeholder.com/150';
  final String username = 'John Doe';
  final String phoneNumber = '+1234567890';
  final String email = 'johndoe@example.com';
  final String gender = 'Male';
  final String preferredPosition = 'Midfielder';
  final String availability = 'Weekends, Evenings';
  final String location = 'New York, USA';
  final String experienceLevel = 'Intermediate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
        centerTitle: true,
        backgroundColor: Colors.teal, // AppBar color set to teal
        titleTextStyle: TextStyle(color: Colors.white), // White text in AppBar
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white, // White background for the profile view screen
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Profile Picture Section with Shadow
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(profilePicture),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Edit Button with Light Green Theme
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Edit button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen, // Light Green button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Username Section
                _buildInfoRow(Icons.person, 'Username', username),
                const Divider(color: Colors.grey, thickness: 1), // Thin grey divider
                const SizedBox(height: 16),

                // Phone Number Section
                _buildInfoRow(Icons.phone, 'Phone Number', phoneNumber),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Email Section
                _buildInfoRow(Icons.email, 'Email', email),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Gender Section
                _buildInfoRow(Icons.transgender, 'Gender', gender),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Preferred Playing Position Section
                _buildInfoRow(Icons.sports_soccer, 'Preferred Position', preferredPosition),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Availability Section
                _buildInfoRow(Icons.access_time, 'Availability', availability),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Location Section
                _buildInfoRow(Icons.location_on, 'Location', location),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                // Experience Level Section
                _buildInfoRow(Icons.star, 'Experience Level', experienceLevel),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create info rows with icon, title, and value
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal), // Green icon
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            '$title: $value',
            style: TextStyle(
              fontSize: 16, // Normal text size
              fontWeight: FontWeight.normal, // Normal font weight
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
