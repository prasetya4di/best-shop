import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/check_shopping_cart_item.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class CheckShoppingCartItemImpl implements CheckShoppingCartItem {
  final ShoppingCartRepository _repository;
  final UserRepository _userRepository;

  CheckShoppingCartItemImpl(this._repository, this._userRepository);

  @override
  bool call() {
    User currentUser = _userRepository.get();
    return _repository.checkShoppingCartItem(currentUser);
  }
}
