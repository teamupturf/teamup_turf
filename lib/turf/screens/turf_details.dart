import 'package:flutter/material.dart';

class TurfDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 12, 12),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          'Turf Details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.network(
              'https://5.imimg.com/data5/SELLER/Default/2022/12/GT/XH/CW/2451824/cricket-turf.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PEEYO ARENA',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Colors.grey.shade400,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Kallai Rd, behind Bath O Sanitation, Chalappuram, Kozhikode, Kerala',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Descriptions',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Kallai Rd, behind Bath O Sanitation, Chalappuram, Kozhikode, Kerala',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                              'Available Time Slots',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Wrap(
                              spacing: 8.0, // Horizontal space between chips
                              runSpacing:
                                  4.0, // Vertical space between lines of chips
                              children: [
                                _buildTimeSlotChip('9:00 AM - 11:00 AM'),
                                _buildTimeSlotChip('11:00 AM - 1:00 PM'),
                                _buildTimeSlotChip('1:00 PM - 3:00 PM'),
                                _buildTimeSlotChip('3:00 PM - 5:00 PM'),
                                _buildTimeSlotChip('5:00 PM - 7:00 PM'),
                              ],
                            ),
                            SizedBox(height: 16),

                            Text(
                              'Amenities',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Column(
                              children: [
                                _buildAmenityItem(
                                    Icons.room_service, 'Dressing Room'),
                                _buildAmenityItem(
                                    Icons.local_parking, 'Parking'),
                                _buildAmenityItem(
                                    Icons.local_drink, 'Purified Water'),
                                _buildAmenityItem(Icons.wc, 'Washroom'),
                              ],
                            ),
                            SizedBox(height: 16),
                            // Available Time Slots Section with Chips

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Center(child: Text('Edit')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              icon,
              size: 20,
              color: Colors.green,
            ),
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotChip(String timeSlot) {
    return Chip(
      label: Text(
        timeSlot,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
