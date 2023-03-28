import 'package:my_marketplace/domain/delete_shopping_cart.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';

class DeleteShoppingCartImpl implements DeleteShoppingCart {
  final ShoppingCartRepository _repository;

  DeleteShoppingCartImpl(this._repository);

  @override
  call(int id) {
    _repository.delete(id);
  }
}
