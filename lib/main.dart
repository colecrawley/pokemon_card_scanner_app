import 'package:flutter/material.dart';
import 'package:test_scanner_app/screens/home_page.dart';
import 'screens/profile.dart'; // Adjust the import based on your folder structure
import 'models/pokemon_card.dart'; // Import your model, adjust the path as necessary

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Replace with your initial screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample portfolio for demonstration
    List<CardData> portfolio = []; // Replace with your actual data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to ProfilePage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(portfolio: portfolio), // Pass your portfolio here
              ),
            );
          },
          child: const Text('Go to Profile'),
        ),
      ),
    );
  }
}
