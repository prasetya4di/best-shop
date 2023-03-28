import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/domain/delete_shopping_cart.dart';
import 'package:my_marketplace/domain/get_shopping_carts.dart';
import 'package:my_marketplace/view/shopping_cart/viewmodel/shopping_cart_state.dart';

class ShoppingCartViewModel extends ChangeNotifier {
  final GetShoppingCarts _getShoppingCarts;
  final DeleteShoppingCart _deleteShoppingCart;

  ShoppingCartViewModel(this._getShoppingCarts, this._deleteShoppingCart);

  ShoppingCartState _state = ShoppingCartIdleState();
  List<ShoppingCart> _shoppingCarts = [];

  ShoppingCartState get state => _state;

  List<ShoppingCart> get shoppingCarts => _shoppingCarts;

  getShoppingCarts() {
    _state = ShoppingCartLoadingState();
    notifyListeners();

    _shoppingCarts = _getShoppingCarts();
    _state = _shoppingCarts.isEmpty
        ? ShoppingCartEmptyState()
        : ShoppingCartLoadedState();
    notifyListeners();
  }

  removeShoppingCart(int id) {
    _state = ShoppingCartLoadingState();
    notifyListeners();

    _deleteShoppingCart(id);
    _shoppingCarts.removeWhere((element) => element.obxId == id);
    _state = _shoppingCarts.isEmpty
        ? ShoppingCartEmptyState()
        : ShoppingCartRemovedItemState();
    notifyListeners();
  }
}
