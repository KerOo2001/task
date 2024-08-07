import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/database.dart';
import '../widgets/product_card.dart';
import 'add_product.dart';
import 'update_product.dart';

class AdminHome extends StatelessWidget {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _db.getProducts(), // Stream of products from the database
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator()); // Loading indicator
          }

          List<Product>? products = snapshot.data; // Fetch data from snapshot
          if (products == null || products.isEmpty) {
            return Center(
                child: Text('No products available.')); // No products case
          }

          return ListView.builder(
            itemCount: products.length, // Number of products
            itemBuilder: (context, index) {
              final product = products[index]; // Current product
              return ProductCard(product: product); // Display product card
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()),
              );
            },
            child: Icon(Icons.add),
            heroTag: 'addProduct',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProduct()),
              );
            },
            child: Icon(Icons.update),
            heroTag: 'updateProduct',
          ),
        ],
      ),
    );
  }
}
