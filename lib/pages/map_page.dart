import 'package:agrimap/pages/analysefarm.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to Analyse Farm Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => anlysefarm()),
            );
          },
          label: const Text('Analyse your farm with us'),
          icon: const Icon(Icons.agriculture),
          backgroundColor: Colors.green, // Set the button color to green
        ),
      ),
    );
  }
}
