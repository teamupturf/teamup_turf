import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Dummy data for carousel and nearby turfs
  final List<String> bannerImages = [
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200/ff7f7f',
    'https://via.placeholder.com/400x200/87ceeb',
  ];

  final List<Map<String, String>> nearbyTurfs = [
    {
      'name': 'Game On',
      'location': 'East Nadakkavu',
      'image': 'https://via.placeholder.com/150x100/4caf50',
      'sports': '⚽ +1 more' // Only football sport
    },
    {
      'name': 'Redrockz Football Ground',
      'location': 'Opp Malabar Eye Hospital, Eranhipalam',
      'image': 'https://via.placeholder.com/150x100/ff5722',
      'sports': '⚽' // Only football sport
    },
  ];

  // Pages for bottom navigation
  final List<Widget> _pages = [
    const HomePageContent(),
    const BookingsPage(),
    const MessagesPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:HomePageContent() ,);
  
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carousel Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            items: [
              'https://via.placeholder.com/400x200',
              'https://via.placeholder.com/400x200/ff7f7f',
              'https://via.placeholder.com/400x200/87ceeb',
            ].map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Nearby Grounds Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Nearby Grounds',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
               
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TurfCard extends StatelessWidget {
  final Map<String, String> turf;
  const TurfCard({super.key, required this.turf});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
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
              height: 120,
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
            child: Text(turf['sports']!), // Only football sport
          ),
        ],
      ),
    );
  }
}

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your Booking Information Goes Here',
        style: TextStyle(fontSize: 18, color: Colors.teal),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Messages Section',
        style: TextStyle(fontSize: 18, color: Colors.teal),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'User Profile Section',
        style: TextStyle(fontSize: 18, color: Colors.teal),
      ),
    );
  }
}
