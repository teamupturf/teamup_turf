import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:teamup_turf/admin/services/admin_api_services.dart';

class TurfDetailsScreen extends StatefulWidget {
  final String turfId;
  final List<String> timeSlots;
  final List<String> amenities;

  TurfDetailsScreen({
    required this.turfId,
    required this.timeSlots,
    required this.amenities,
  });

  @override
  State<TurfDetailsScreen> createState() => _TurfDetailsScreenState();
}

class _TurfDetailsScreenState extends State<TurfDetailsScreen> {
  Future<Map<String, dynamic>> fetchTurfDetails() async {
    try {
      return await AdminApiServices().getSingleTurf(turfId: widget.turfId);
    } catch (e) {
      throw Exception("Failed to fetch turf details: $e");
    }
  }

  void _showImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: 1,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(imageUrl),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(color: Colors.black),
                pageController: PageController(),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchTurfDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No data found",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final turfDetails = snapshot.data!;
          return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Turf Image with Gradient Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () => _showImage(context, (turfDetails['imageUrl'] != null && turfDetails['imageUrl'].isNotEmpty)
      ? turfDetails['imageUrl'][0]
      : 'https://via.placeholder.com/150',), // Show image when tapped
                    child: Image.network(
                       (turfDetails['imageUrl'] != null && turfDetails['imageUrl'].isNotEmpty)
      ? turfDetails['imageUrl'][0]
      : 'https://via.placeholder.com/150',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Turf Name, Distance, and Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        turfDetails['turfName'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red, size: 20),
                          SizedBox(width: 8),
                          Text(
                            turfDetails['location'],
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.star, color: Colors.yellow[700], size: 20),
                          SizedBox(width: 8),
                          Text(
                            // rating.toStringAsFixed(1),
                            '4',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact Info with Divider
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        // Contact Info Row
                        Row(
                          children: [
                            Text(
                              turfDetails['contact'],
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.phone, color: Colors.green[800]),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(255, 220, 219, 219)),
                        SizedBox(height: 10),

                        // Fair Info Row
                        Row(
                          children: [
                            Text(
                              turfDetails['fair'],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.attach_money, color: Colors.green[800]),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(255, 220, 219, 219)),
                        SizedBox(height: 10),

                        // Time Slots Title
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Available Time Slots:",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Time Slots in Bubble-like Arrangement
                        Wrap(
                          spacing: 1,
                          runSpacing: 5,
                          children:widget.timeSlots.map((slot) {
                            return Chip(
                              label: Text(
                                slot,
                                style: TextStyle(fontSize: 12, color: Colors.green),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Document Link Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: GestureDetector(
                    onTap: () {
                      _showImage(context, turfDetails['documentUrl']?[0] ?? 'https://via.placeholder.com/150');
                    },
                    child: Text(
                      "View Document",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      );
        },
      ),
    );
  }
}
