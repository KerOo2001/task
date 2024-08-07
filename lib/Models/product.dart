class Product {
  final String id; // Assuming you have an ID
  final String name;
  final double price;
  final String code; // Add this property if needed
  final int quantity; // Ensure this property exists
  final String url; // URL for the image

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.code, // Include in constructor
    required this.quantity,
    required this.url,
  });
}
