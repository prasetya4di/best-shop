import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';

class ListProducts extends StatelessWidget {
  final List<Product> products;

  const ListProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];

          return InkWell(
            onTap: () {
              context.push("${Routes.product}/${product.obxId}");
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(product.imagePath),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle.medium(text: product.name),
                        if (product.category.hasValue)
                          Text(
                            product.category.target?.name ?? "",
                            style: const TextStyle(
                                color: AssetColors.gray300, fontSize: 10),
                          ),
                        const SpaceVertical(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${product.price}"),
                            Text("${product.stock}"),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
