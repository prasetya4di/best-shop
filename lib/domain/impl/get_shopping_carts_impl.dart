import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/get_shopping_carts.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class GetShoppingCartsImpl implements GetShoppingCarts {
  final ShoppingCartRepository _repository;
  final UserRepository _userRepository;

  GetShoppingCartsImpl(this._repository, this._userRepository);

  @override
  List<ShoppingCart> call() {
    User currentUser = _userRepository.get();
    return _repository.get(currentUser);
  }
}
