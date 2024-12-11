import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            BannerCarousel(),
            const SizedBox(height: 30), // Increased spacing between sections
            NearbyAndRequests(),
            const SizedBox(height: 30), // Space before Quick Book section
            QuickBookSection(),
            const SizedBox(height: 40), // Extra space at the bottom for better layout
          ],
        ),
      ),
    );
  }
}

class QuickBookSection extends StatelessWidget {
  const QuickBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.green, Colors.greenAccent]),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          // Navigate to booking page
        },
        child: const Text(
          'Quick Book a Turf Now!',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR86JwAGpII4DI79L0X45S1L71_mNNyJ3dC2A&s',
      'https://content.jdmagicbox.com/v2/comp/kolkata/w3/033pxx33.xx33.240126100542.p7w3/catalogue/inside-out-turf-sodepur-kolkata-sports-clubs-eskdy5lmf1.jpg',
      'https://via.placeholder.com/400x200/87ceeb',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 180,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
          ),
          items: bannerImages.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(image),

                  fit: BoxFit.fitWidth,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


class NearbyAndRequests extends StatelessWidget {
  const NearbyAndRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Nearby Grounds',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.left, // Align text to the left
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(3, (index) {
              return NearbyGroundCard(
                turf: {
                  'name': 'Turf ${index + 1}',
                  'location': 'Location ${index + 1}',
                  'image': 'https://via.placeholder.com/150x100',
                  'sports': '⚽ +2 sports',
                },
              );
            }),
          ),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Team Requests',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.left, // Align text to the left
          ),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Example team requests
          itemBuilder: (context, index) {
            return TeamRequestCard(
              request: {
                'captain': 'Captain ${index + 1}',
                'message': 'Looking for 2 more players for football.',
              },
            );
          },
        ),
      ],
    );
  }
}



class NearbyGroundCard extends StatelessWidget {
  final Map<String, String> turf;
  const NearbyGroundCard({super.key, required this.turf});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.green
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              turf['image']!,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              turf['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              turf['location']!,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Text(
              turf['sports']!,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamRequestCard extends StatelessWidget {
  final Map<String, String> request;
  const TeamRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade50, // Light green background for requests
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green.shade300),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.group, color: Colors.green, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Request from ${request['captain']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(request['message']!),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
