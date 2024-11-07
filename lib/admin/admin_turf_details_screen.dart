import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class TurfDetailsScreen extends StatelessWidget {
  final String name;
  final String location;
  final String contact;
  final String imageUrl;
  final String documentUrl;
  final String fair;
  final List<String> timeSlots;
  final double distance;
  final double rating;
  final List<String> amenities;

  TurfDetailsScreen({
    required this.name,
    required this.location,
    required this.contact,
    required this.imageUrl,
    required this.documentUrl,
    required this.fair,
    required this.timeSlots,
    required this.distance,
    required this.rating,
    required this.amenities,
  });

  // Function to show the image in full-screen with zoom and close button
  void _showImage(BuildContext context) {
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
      body: SingleChildScrollView(
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
                    onTap: () => _showImage(context), // Show image when tapped
                    child: Image.network(
                      imageUrl,
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
                        name,
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
                            location,
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.star, color: Colors.yellow[700], size: 20),
                          SizedBox(width: 8),
                          Text(
                            rating.toStringAsFixed(1),
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
                              contact,
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
                              "$fair",
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
                          children: timeSlots.map((slot) {
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
                      _showImage(context);
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
      ),
    );
  }
}
