import 'package:second/models/product.dart';

class DatabaseService {
  // Mock stream of products
  Stream<List<Product>> getProducts() async* {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    yield [
      Product(id: '1', name: 'Product 1', price: 29.99),
      Product(id: '2', name: 'Product 2', price: 19.99),
    ];
  }
}
