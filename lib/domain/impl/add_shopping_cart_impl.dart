import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/add_shopping_cart.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class AddShoppingCartImpl implements AddShoppingCart {
  final UserRepository _userRepository;
  final ShoppingCartRepository _repository;

  AddShoppingCartImpl(this._repository, this._userRepository);

  @override
  call(ShoppingCart shoppingCart) {
    ShoppingCart? currShopingCart =
        _repository.getByProductId(shoppingCart.product.target!);
    if (currShopingCart != null) {
      currShopingCart.totalStock += shoppingCart.totalStock;
      currShopingCart.totalPrice += shoppingCart.totalPrice;
      _repository.update(currShopingCart);
    } else {
      User currentUser = _userRepository.get();
      shoppingCart.customer.target = currentUser;
      _repository.insert(shoppingCart);
    }
  }
}
