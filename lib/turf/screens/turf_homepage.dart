import 'package:flutter/material.dart';

class TurfHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turf Management'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        color: Colors.green.shade50,
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 16.0, // space between columns
            mainAxisSpacing: 16.0, // space between rows
            childAspectRatio: 1.0, // Equal size for all cards
          ),
          itemCount: 5, // Only 5 items now
          itemBuilder: (context, index) {
            if (index == 4) {
              // Chatting button
              return _buildFeatureCard(
                context,
                title: 'Chatting',
                icon: Icons.chat,
                color: Colors.red,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChattingPage()),
                ),
              );
            } else {
              // Other feature cards
              return _buildFeatureCard(
                context,
                title: _getFeatureTitle(index),
                icon: _getFeatureIcon(index),
                color: _getFeatureColor(index),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _getFeaturePage(index)),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  // Returns the title for each feature card
  String _getFeatureTitle(int index) {
    switch (index) {
      case 0:
        return 'Turf Details';
      case 1:
        return 'Bookings';
      case 2:
        return 'Profile';
      case 3:
        return 'Tournaments';
      default:
        return '';
    }
  }

  // Returns the icon for each feature card
  IconData _getFeatureIcon(int index) {
    switch (index) {
      case 0:
        return Icons.grass;
      case 1:
        return Icons.calendar_today;
      case 2:
        return Icons.person;
      case 3:
        return Icons.emoji_events;
      default:
        return Icons.chat;
    }
  }

  // Returns the color for each feature card
  Color _getFeatureColor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.purple;
      default:
        return Colors.red;
    }
  }

  // Returns the page for each feature card
  Widget _getFeaturePage(int index) {
    switch (index) {
      case 0:
        return TurfDetailsPage();
      case 1:
        return BookingManagementPage();
      case 2:
        return UserProfilePage();
      case 3:
        return TournamentsPage();
      default:
        return ChattingPage();
    }
  }

  // Builds a feature card widget
  Widget _buildFeatureCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example Pages for navigation
class ChattingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatting'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: const Text(
          'Chat features will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class TurfDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turf Details'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: const Text(
          'Turf Details will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class BookingManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Management'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: const Text(
          'Manage your bookings here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: const Text(
          'User Profile details will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class TournamentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournaments'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: const Text(
          'Tournaments details will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
