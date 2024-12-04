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
      backgroundColor: Colors.teal,
      
      appBar: AppBar(
        title: const Text(
          'TEAMUP TURF',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          SearchBar(),
          BannerCarousel(),
          SizedBox(height: 10), // Consistent spacing
          Expanded(
            child: NearbyAndRequests(), // Combines Nearby Grounds and Team Requests
          ),
          SizedBox(height: 10), // Space before Quick Book section
          QuickBookSection(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for turfs, locations, amenities...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
        onChanged: (value) {
          // Handle search functionality here
        },
      ),
    );
  }
}

class QuickBookSection extends StatelessWidget {
  const QuickBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Consistent horizontal padding
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.teal, Colors.green]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            // Navigate to booking page
          },
          child: const Text(
            'Quick Book a Turf Now!',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
      'https://via.placeholder.com/400x200',
      'https://via.placeholder.com/400x200/ff7f7f',
      'https://via.placeholder.com/400x200/87ceeb',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 150,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
          ),
          items: bannerImages.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
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
        return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nearby Grounds Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Nearby Grounds',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 20),
          // Team Requests Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Team Requests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
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
      ),
    );
  }
}

class NearbyGroundCard extends StatelessWidget {
  final Map<String, String> turf;
  const NearbyGroundCard({super.key, required this.turf});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              turf['image']!,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              turf['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(turf['location']!),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(turf['sports']!),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal.shade300),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.group, color: Colors.teal),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Request from ${request['captain']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    request['message']!,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

