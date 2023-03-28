import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/view/shopping_cart/widgets/shopping_cart_item.dart';

class ListShoppingCart extends StatelessWidget {
  final List<ShoppingCart> _shoppingCarts;

  const ListShoppingCart(this._shoppingCarts, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _shoppingCarts.length,
        itemBuilder: (context, index) {
          ShoppingCart shoppingCart = _shoppingCarts[index];

          return ShoppingCartItem(shoppingCart: shoppingCart);
        });
  }
}
