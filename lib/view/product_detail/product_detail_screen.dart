import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [Text("$productId")],
      ),
    );
  }
}
