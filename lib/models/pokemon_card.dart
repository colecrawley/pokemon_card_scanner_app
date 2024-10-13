class CardData {
  final String name;
  final double marketPrice;
  final int priceChange;
  final String imageUrl; // Make sure this exists

  CardData({
    required this.name,
    required this.marketPrice,
    required this.priceChange,
    required this.imageUrl, // This is the required parameter
  });
}

