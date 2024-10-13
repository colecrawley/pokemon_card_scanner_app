import 'package:flutter/material.dart';
// Import for File handling
import '../models/pokemon_card.dart'; // Import the CardData class

class ProfilePage extends StatefulWidget {
  final List<CardData> portfolio; // Accept the portfolio list

  const ProfilePage({super.key, required this.portfolio}); // Constructor to accept the portfolio

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'Cole'; // Default username
  final double _totalValue = 12452.00; // Default total value
  String _bio = 'This is my bio.'; // Default bio
  final String _profileImageUrl = 'assets/images/user_avatar.png'; // Default image path

  void _editUsername() async {
    String? newUsername = await _showEditUsernameDialog();
    if (newUsername != null && newUsername.isNotEmpty) {
      setState(() {
        _username = newUsername; // Update username if not empty
      });
    }
  }

  void _editBio() async {
    String? newBio = await _showEditBioDialog();
    if (newBio != null && newBio.isNotEmpty) {
      setState(() {
        _bio = newBio; // Update bio if not empty
      });
    }
  }

  Future<String?> _showEditUsernameDialog() {
    TextEditingController controller = TextEditingController(text: _username);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Username'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text); // Return the new username
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close without saving
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showEditBioDialog() {
    TextEditingController controller = TextEditingController(text: _bio);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Bio'),
          content: TextField(
            controller: controller,
            maxLength: 500,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Enter your bio'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text); // Return the new bio
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close without saving
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalCards = widget.portfolio.length; // Get the total number of cards in the portfolio

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile information section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_profileImageUrl), // Default image
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _editUsername, // Tap to edit username
                        child: Text(
                          _username, // Display the updated username
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _editBio, // Tap to edit bio
                        child: Text(
                          _bio, // Display the user's bio
                          style: const TextStyle(color: Colors.black54), // Optional: style the bio to indicate it's editable
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card statistics section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text('Total Cards'),
                      Text(
                        '$totalCards', // Dynamically update the total cards
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Performance tracking section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Performance Tracking',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
