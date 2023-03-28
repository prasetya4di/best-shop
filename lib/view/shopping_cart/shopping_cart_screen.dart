import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/shopping_cart/viewmodel/shopping_cart_state.dart';
import 'package:my_marketplace/view/shopping_cart/viewmodel/shopping_cart_viewmodel.dart';
import 'package:my_marketplace/view/shopping_cart/widgets/empty_shopping_cart.dart';
import 'package:my_marketplace/view/shopping_cart/widgets/list_shopping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  late ShoppingCartViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = context.read();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      viewModel.getShoppingCarts();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ShoppingCart> shoppingCarts =
        context.watch<ShoppingCartViewModel>().shoppingCarts;
    ShoppingCartState state = context.watch<ShoppingCartViewModel>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).shoppingCart),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: state is ShoppingCartEmptyState
            ? const EmptyShoppingCart()
            : ListShoppingCart(shoppingCarts),
      ),
    );
  }
}
