import 'package:flutter/material.dart';
import 'package:simple_belfort_app/models/attraction.dart';
import 'package:simple_belfort_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Attraction> attractions = [
    Attraction(
      id: 'lion',
      name: 'Lion of Belfort',
      description: 'A monumental sandstone sculpture by Auguste Bartholdi, symbolising French resistance.',
      imagePath: 'assets/images/lion_of_belfort.jpg',
    ),
     Attraction(
      id: 'cathedral',
      name: 'Cathedral of Saint-Christophe',
      description: 'A beautiful Gothic-style cathedral with stunning stained glass windows.',
      imagePath: 'assets/images/cathedrale_saint_christian.jpg',
    ),
    Attraction(
      id: 'citadel',
      name: 'Belfort Citadel',
      description: 'A historic fortress designed by Vauban, offering panoramic views of the city.',
      imagePath: 'assets/images/belfort_citadel.jpg',
    ),
   
  ];

  void _navigateToDetail(Attraction attraction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          attraction: attraction,
          onVisited: () {
            setState(() {
              attraction.isVisited = true;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Belfort'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final attraction = attractions[index];
          return Card(
            elevation: 4, // Simple card elevation
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: InkWell(
              onTap: () => _navigateToDetail(attraction),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Hero(
                      tag: 'attractionImage-${attraction.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          attraction.imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attraction.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            attraction.description,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (attraction.isVisited)
                      const Icon(Icons.check_circle, color: Colors.green)
                    else
                      const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}