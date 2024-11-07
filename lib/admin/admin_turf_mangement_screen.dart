import 'package:flutter/material.dart';
import 'package:teamup_turf/admin/admin_turf_details_screen.dart';

class AdminTurfManagementScreen extends StatefulWidget {
  @override
  _AdminTurfManagementScreenState createState() =>
      _AdminTurfManagementScreenState();
}

class _AdminTurfManagementScreenState extends State<AdminTurfManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Turf Management",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4.0,
          tabs: [
            const Tab(text: "Pending"),
            const Tab(text: "Approved"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TurfListTab(status: "Pending"),
          TurfListTab(status: "Approved"),
        ],
      ),
    );
  }
}

class TurfListTab extends StatelessWidget {
  final String status;

  TurfListTab({required this.status});

  @override
  Widget build(BuildContext context) {
    // Replace this with actual data from your database
    List<Map> turfList = [
      {
        'name': 'Green Field Turf',
        'location': 'Bangalore',
        'contact': '1234567890',
        'imageUrl': 'https://via.placeholder.com/150',
        'documentUrl': 'https://example.com/document.pdf',
        'fair': '₹500/hour',
        'timeSlots': ['9:00 AM - 11:00 AM', '1:00 PM - 3:00 PM'],
      },
      {
        'name': 'Sports Arena Turf',
        'location': 'Mumbai',
        'contact': '0987654321',
        'imageUrl': 'https://via.placeholder.com/150',
        'documentUrl': 'https://example.com/document.pdf',
        'fair': '₹700/hour',
        'timeSlots': ['10:00 AM - 12:00 PM', '4:00 PM - 6:00 PM'],
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: turfList.length,
      itemBuilder: (context, index) {
        final turf = turfList[index];
        return TurfCard(
          name: turf['name']!,
          location: turf['location']!,
          contact: turf['contact']!,
          imageUrl: turf['imageUrl']!,
          documentUrl: turf['documentUrl']!,
          fair: turf['fair']!,
          timeSlots: turf['timeSlots'] as List<String>,
          status: status,
        );
      },
    );
  }
}

class TurfCard extends StatelessWidget {
  final String name;
  final String location;
  final String contact;
  final String imageUrl;
  final String documentUrl;
  final String fair;
  final List<String> timeSlots;
  final String status;

  TurfCard({
    required this.name,
    required this.location,
    required this.contact,
    required this.imageUrl,
    required this.documentUrl,
    required this.fair,
    required this.timeSlots,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TurfDetailsScreen(
              name: name,
              location: location,
              contact: contact,
              imageUrl: imageUrl,
              documentUrl: documentUrl,
              fair: fair,
              timeSlots: timeSlots, distance: 19, rating: 5, amenities: [
                'hi'
              ],
            ),
          ),);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Location: $location",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        Text(
                          "Contact: $contact",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(height: 20, thickness: 1, color: Colors.grey[300]),
              Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Open document URL in a web browser
                    },
                    child: const Text(
                      "View Document",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Add Accept and Reject buttons below
              if (status == "Pending")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle accept action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Turf accepted!")),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.green,
                            ),
                            
                            shape:
                                 RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                 ) // Accept button color
                            ),
                        child: const Text("Accept",style: TextStyle(
                              color: Colors.green,
                            ),),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle accept action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Turf rejected!")),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            side: const BorderSide(
                              color: Colors.red,
                            ),
                            shape:
                                 RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                ) // Accept button color
                            ),
                        child: const Text("Reject",style: TextStyle(
                              color: Colors.red,
                            ),),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
