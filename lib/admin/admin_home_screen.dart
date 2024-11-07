import 'package:flutter/material.dart';
import 'package:teamup_turf/admin/admin_feedback_screen.dart';
import 'package:teamup_turf/admin/admin_new_update_screen.dart';
import 'package:teamup_turf/admin/admin_payment_management.dart';
import 'package:teamup_turf/admin/admin_turf_mangement_screen.dart';
import 'package:teamup_turf/admin/admin_user_management.dart';

class AdminHomeScreen extends StatelessWidget {
  // Function to navigate to the selected option
  void navigateToOption(BuildContext context, String option) {
    // Replace with navigation logic based on the option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to $option')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome, Admin",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        automaticallyImplyLeading: false, // Removes the back arrow
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/turf-bg.jpg"), // replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAdminOption(
                  context,
                  icon: Icons.sports_soccer,
                  label: "Turf management",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminTurfManagementScreen() ,));
                  }
                ),
                _buildAdminOption(
                  context,
                  icon: Icons.people,
                  label: "User management",
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return UserManagementScreen();
                    },) );
                  },
                ),
                _buildAdminOption(
                  context,
                  icon: Icons.star,
                  label: "Feed back",
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminFeedbackScreen(),));


                  },
                ),
                _buildAdminOption(
                  context,
                  icon: Icons.payment,
                  label: "Payment management",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AdminPaymentManagementScreen();
                    },));
                  },
                ),
                _buildAdminOption(
                  context,
                  icon: Icons.update,
                  label: "News update",
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NewsUpdateScreen();
                    },));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.green[800],
              size: 25,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green[800],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.green[800],
            ),
          ],
        ),
      ),
    );
  }
}
