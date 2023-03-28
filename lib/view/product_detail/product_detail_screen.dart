import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/product_detail/viewmodel/product_detail_viewmodel.dart';
import 'package:my_marketplace/view/widgets/space_horizontal.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    ProductDetailViewModel viewModel = context.read();
    Product? product = context.watch<ProductDetailViewModel>().product;

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      viewModel.getProduct(productId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(product?.name ?? "",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(product?.imagePath ?? ""),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextTitle.medium(text: product?.name ?? ""),
                    if (product?.category.hasValue ?? false)
                      Text(product?.category.target?.name ?? ""),
                    Text("\$${product?.price}"),
                    Text("Qty: ${product?.stock}"),
                    Text(product?.description ?? ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.pop;
                },
                child: Text(S.of(context).addToCart),
              ),
            ),
            const SpaceHorizontal(),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    context.pop;
                  },
                  child: Text(S.of(context).buyNow)),
            )
          ],
        ),
      ),
    );
  }
}
