import 'package:flutter/material.dart';
import 'package:teamup_turf/splash_screen.dart';
import 'package:teamup_turf/user/services/user_auth_services.dart';

class ProfileViewScreen extends StatefulWidget {
  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  final String profilePicture = 'https://via.placeholder.com/150';

  final String username = 'John Doe';

  final String phoneNumber = '+1234567890';

  final String email = 'johndoe@example.com';

  final String gender = 'Male';

  final String preferredPosition = 'Midfielder';

  final String availability = 'Weekends, Evenings';

  final String location = 'New York, USA';

  final String experienceLevel = 'Intermediate';

  Future<void> _deleteAccount() async {
    try{
      final id = await UserAuthServices().getToken();
      final result = await UserAuthServices().delete(id: id.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
    // Placeholder function for account deletion logic
    print('Account deleted!');
    // Implement account deletion functionality here
  }

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

                // Profile Details Sections
                _buildInfoRow(Icons.person, 'Username', username),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.phone, 'Phone Number', phoneNumber),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.email, 'Email', email),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.transgender, 'Gender', gender),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.sports_soccer, 'Preferred Position', preferredPosition),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.access_time, 'Availability', availability),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.location_on, 'Location', location),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 16),

                _buildInfoRow(Icons.star, 'Experience Level', experienceLevel),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 24),

                // Delete Button
                Center(
                  child: TextButton(
                    onPressed: () {
                      _confirmDeletion(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red, // Red text color
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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

  // Confirm Deletion Dialog
  void _confirmDeletion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Account Deletion'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                _deleteAccount(); // Call delete account function
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red button color
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }


}
