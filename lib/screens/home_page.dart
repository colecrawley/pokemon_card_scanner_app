import 'package:flutter/material.dart';
import 'package:test_scanner_app/screens/portfolio.dart';
import 'package:test_scanner_app/screens/profile.dart';
import '../models/pokemon_card.dart'; // Importing the CardData class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the selected index for the bottom navigation bar

  // Placeholder values for total value and change
  final double valueChange = 1833.00; // Example total change in value

  // Function to handle item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Scanner'),
      ),
      body: _getSelectedPage(_selectedIndex), // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight selected index
        selectedItemColor: Colors.blue, // Change selected item color
        unselectedItemColor: Colors.grey, // Color for unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        onTap: _onItemTapped, // Handle taps on items
      ),
    );
  }

  // Function to return the appropriate page based on selected index
  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return _buildHomePage(); // Home page
      case 1:
        return const Center(child: Text('Search Page')); // Placeholder for Search
      case 2:
        return const PortfolioPage(); // Your Portfolio page
      case 3:
        return ProfilePage(portfolio: PortfolioPage.pokemonCards); // Pass the portfolio to the ProfilePage
      default:
        return _buildHomePage(); // Default to Home page
    }
  }

  // Method to build the Home Page UI
  Widget _buildHomePage() {
    // Access the pokemonCards from PortfolioPage and calculate total value
    final List<CardData> valuableCards = PortfolioPage.pokemonCards;
    final double totalValue = valuableCards.fold(0, (sum, card) => sum + card.marketPrice);

    // Sort cards by market price in descending order and get top 10
    final List<CardData> topGainers = valuableCards
      ..sort((a, b) => b.marketPrice.compareTo(a.marketPrice));

    // Take the top 10 gainers (or fewer if there are not enough cards)
    final List<CardData> topTenGainers = topGainers.take(10).toList();

    return Center(
      child: SingleChildScrollView( // Make the column scrollable
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20), // Spacing at the top
            const Text(
              'Showing your value for: Vintage', // Example title
              style: TextStyle(fontSize: 18, color: Colors.black45),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${totalValue.toStringAsFixed(2)}', // Format total value
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial', // Change to your desired font
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${valueChange.toStringAsFixed(2)} in the last 30 days', // Example static value change
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green, // Use green color for gains
              ),
            ),

            // Placeholder for the graph (you could use a graph library like fl_chart here)
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.green.withOpacity(0.1), // Just a placeholder color for now
              child: const Center(
                child: Text('Graph Placeholder'), // Placeholder text for the graph
              ),
            ),
            const SizedBox(height: 20), // Space between graph and list
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Gainers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10), // Space between title and list
                  // Scrollable List of Top Gainers
                  SizedBox(
                    height: 200, // Adjust height as needed
                    child: ListView.builder(
                      itemCount: topTenGainers.length,
                      itemBuilder: (context, index) {
                        final card = topTenGainers[index];
                        return ListTile(
                          leading: Image.network(card.imageUrl), // Display card image
                          title: Text(card.name),
                          subtitle: Text('\$${card.marketPrice.toStringAsFixed(2)}'),
                          trailing: Text(
                            '${card.priceChange > 0 ? '+' : ''}${card.priceChange}%',
                            style: TextStyle(
                              color: card.priceChange > 0
                                  ? Colors.green
                                  : (card.priceChange < 0 ? Colors.red : Colors.black),
                            ),
                          ),
                        );
                      },
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
