import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  // Sample Pokémon cards with placeholder images and market prices
  static List<CardData> pokemonCards = [
    CardData(name: 'Pikachu', imageUrl: 'https://via.placeholder.com/150?text=Pikachu', marketPrice: 500.00, priceChange: 10),
    CardData(name: 'Charizard', imageUrl: 'https://via.placeholder.com/150?text=Charizard', marketPrice: 450.00, priceChange: -5),
    CardData(name: 'Mewtwo', imageUrl: 'https://via.placeholder.com/150?text=Mewtwo', marketPrice: 300.00, priceChange: 0),
    CardData(name: 'Gengar', imageUrl: 'https://via.placeholder.com/150?text=Gengar', marketPrice: 250.00, priceChange: 8),
    CardData(name: 'Eevee', imageUrl: 'https://via.placeholder.com/150?text=Eevee', marketPrice: 200.00, priceChange: 12),
    CardData(name: 'Bulbasaur', imageUrl: 'https://via.placeholder.com/150?text=Bulbasaur', marketPrice: 150.00, priceChange: -3),
    CardData(name: 'Squirtle', imageUrl: 'https://via.placeholder.com/150?text=Squirtle', marketPrice: 100.00, priceChange: 5),
    CardData(name: 'Snorlax', imageUrl: 'https://via.placeholder.com/150?text=Snorlax', marketPrice: 90.00, priceChange: 0),
    CardData(name: 'Dragonite', imageUrl: 'https://via.placeholder.com/150?text=Dragonite', marketPrice: 80.00, priceChange: -2),
    CardData(name: 'Jigglypuff', imageUrl: 'https://via.placeholder.com/150?text=Jigglypuff', marketPrice: 70.00, priceChange: 4),
    CardData(name: 'Gardevoir', imageUrl: 'https://via.placeholder.com/150?text=Gardevoir', marketPrice: 60.00, priceChange: 15),
    CardData(name: 'Lucario', imageUrl: 'https://via.placeholder.com/150?text=Lucario', marketPrice: 55.00, priceChange: 9),
    CardData(name: 'Lapras', imageUrl: 'https://via.placeholder.com/150?text=Lapras', marketPrice: 50.00, priceChange: 2),
    CardData(name: 'Alakazam', imageUrl: 'https://via.placeholder.com/150?text=Alakazam', marketPrice: 48.00, priceChange: -4),
    CardData(name: 'Machamp', imageUrl: 'https://via.placeholder.com/150?text=Machamp', marketPrice: 45.00, priceChange: 6),
    CardData(name: 'Raichu', imageUrl: 'https://via.placeholder.com/150?text=Raichu', marketPrice: 40.00, priceChange: 11),
    CardData(name: 'Onix', imageUrl: 'https://via.placeholder.com/150?text=Onix', marketPrice: 35.00, priceChange: -1),
    CardData(name: 'Arcanine', imageUrl: 'https://via.placeholder.com/150?text=Arcanine', marketPrice: 33.00, priceChange: 8),
    CardData(name: 'Zapdos', imageUrl: 'https://via.placeholder.com/150?text=Zapdos', marketPrice: 30.00, priceChange: -7),
    CardData(name: 'Machoke', imageUrl: 'https://via.placeholder.com/150?text=Machoke', marketPrice: 28.00, priceChange: 3),
    CardData(name: 'Ninetales', imageUrl: 'https://via.placeholder.com/150?text=Ninetales', marketPrice: 25.00, priceChange: 5),
    CardData(name: 'Gyarados', imageUrl: 'https://via.placeholder.com/150?text=Gyarados', marketPrice: 24.00, priceChange: -2),
    CardData(name: 'Pidgeot', imageUrl: 'https://via.placeholder.com/150?text=Pidgeot', marketPrice: 22.00, priceChange: 4),
    CardData(name: 'Poliwrath', imageUrl: 'https://via.placeholder.com/150?text=Poliwrath', marketPrice: 20.00, priceChange: 0),
    CardData(name: 'Misdreavus', imageUrl: 'https://via.placeholder.com/150?text=Misdreavus', marketPrice: 18.00, priceChange: 7),
    CardData(name: 'Kabutops', imageUrl: 'https://via.placeholder.com/150?text=Kabutops', marketPrice: 16.00, priceChange: -5),
    CardData(name: 'Tandemaus', imageUrl: 'https://via.placeholder.com/150?text=Tandemaus', marketPrice: 899.00, priceChange: 20),
    CardData(name: 'Scraggy', imageUrl: 'https://via.placeholder.com/150?text=Scraggy', marketPrice: 123456.00, priceChange: -3),
    CardData(name: 'Murkrow', imageUrl: 'https://via.placeholder.com/150?text=Murkrow', marketPrice: 5.00, priceChange: -4),
    CardData(name: 'Omanyte', imageUrl: 'https://via.placeholder.com/150?text=Omanyte', marketPrice: 555.00, priceChange: 88)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            childAspectRatio: 0.65, // Adjust aspect ratio for a better fit
            crossAxisSpacing: 10.0, // Spacing between cards
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: pokemonCards.length,
          itemBuilder: (context, index) {
            final card = pokemonCards[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pokémon card image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        card.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  // Pokémon card details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Market Price: \$${card.marketPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price Change: ${card.priceChange > 0 ? '+' : ''}${card.priceChange}%',
                          style: TextStyle(
                            fontSize: 14,
                            color: card.priceChange > 0
                                ? Colors.green
                                : (card.priceChange < 0 ? Colors.red : Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
