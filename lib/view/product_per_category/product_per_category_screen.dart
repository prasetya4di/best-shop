import 'package:flutter/material.dart';
import 'package:my_marketplace/view/product_per_category/viewmodel/product_per_category_viewmodel.dart';
import 'package:my_marketplace/view/product_per_category/widgets/list_products.dart';
import 'package:provider/provider.dart';

class ProductPerCategoryScreen extends StatelessWidget {
  final int categoryId;

  const ProductPerCategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    ProductPerCategoryViewModel viewModel = context.read();

    var category = context.watch<ProductPerCategoryViewModel>().category;
    var products = context.watch<ProductPerCategoryViewModel>().products;

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      viewModel.getProduct(categoryId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? ""),
        foregroundColor: Colors.white,
      ),
      body: ListProducts(products: products),
    );
  }
}
