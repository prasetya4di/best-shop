import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/shopping_cart/viewmodel/shopping_cart_viewmodel.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/confirmation_dialog.dart';
import 'package:my_marketplace/view/widgets/space_horizontal.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';
import 'package:provider/provider.dart';

class ShoppingCartItem extends StatelessWidget {
  final ShoppingCart shoppingCart;

  const ShoppingCartItem({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(shoppingCart.product.target?.imagePath ?? "",
              width: 12 * 10),
          const SpaceHorizontal(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle.large(
                  text: shoppingCart.product.target?.name ?? "", fontSize: 18),
              Text("Qty: ${shoppingCart.totalStock}"),
              Text("\$${shoppingCart.totalPrice.toStringAsFixed(2)}"),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AssetColors.red200)),
                  onPressed: () {
                    showConfirmationDialog(context,
                            S.of(context).deleteShoppingCartConfimation)
                        .then((value) {
                      if (value) {
                        context
                            .read<ShoppingCartViewModel>()
                            .removeShoppingCart(shoppingCart.obxId);
                      }
                    });
                  },
                  child: Text(S.of(context).deleteShoppingCart))
            ],
          )
        ],
      ),
    );
  }
}
