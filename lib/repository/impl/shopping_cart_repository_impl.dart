import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/source/local/shopping_cart_dao.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final ShoppingCartDao _shoppingCartDao;

  ShoppingCartRepositoryImpl(this._shoppingCartDao);

  @override
  delete(int id) {
    _shoppingCartDao.delete(id);
  }

  @override
  List<ShoppingCart> get(User user) => _shoppingCartDao.get(user);

  @override
  insert(ShoppingCart shoppingCart) {
    return _shoppingCartDao.insert(shoppingCart);
  }

  @override
  update(ShoppingCart shoppingCart) {
    return _shoppingCartDao.update(shoppingCart);
  }
}
