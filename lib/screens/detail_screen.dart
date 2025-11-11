import 'package:flutter/material.dart';
import 'package:simple_belfort_app/models/attraction.dart';

class DetailScreen extends StatelessWidget {
  final Attraction attraction;
  final VoidCallback onVisited;

  const DetailScreen({
    super.key,
    required this.attraction,
    required this.onVisited,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero( //Mega swietna animacja obrazka pomiedzy ekranami
              tag: 'attractionImage-${attraction.id}',
              child: Image.asset(
                attraction.imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attraction.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    attraction.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(
                      attraction.isVisited
                          ? Icons.check_circle_outline
                          : Icons.check,
                    ),
                    label: Text(
                        attraction.isVisited ? 'Already Visited' : 'Mark as Visited'),
                    onPressed: attraction.isVisited
                        ? null // Disable button if already visited
                        : () {
                            onVisited(); // Call the callback to update status
                            Navigator.of(context).pop(); // Go back to home screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Marked as Visited! ✅'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // Full width button
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