import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title': 'Breaking News: Flutter 3.7 Released!',
      'description': 'Flutter 3.7 brings some exciting new features for developers.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Tech Innovations in 2024',
      'description': 'The latest innovations in technology shaping the future.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Global Economy Outlook',
      'description': 'Experts predict economic trends for the next year.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Sport News: World Cup Highlights',
      'description': 'Catch up on the best moments from the World Cup.',
      'image': 'https://via.placeholder.com/150',
    },
    // Add more news items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsCard(
              title: newsList[index]['title']!,
              description: newsList[index]['description']!,
              imageUrl: newsList[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const NewsCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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
