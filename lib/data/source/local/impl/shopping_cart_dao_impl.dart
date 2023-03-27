import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/source/local/shopping_cart_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class ShoppingCartDaoImpl implements ShoppingCartDao {
  final Box<ShoppingCart> _box;

  ShoppingCartDaoImpl(this._box);

  @override
  delete(int id) {
    _box.remove(id);
  }

  @override
  List<ShoppingCart> get(User user) {
    Query<ShoppingCart> query =
        _box.query(ShoppingCart_.customer.equals(user.obxId)).build();
    List<ShoppingCart> shoppingCarts = query.find();
    query.close();

    return shoppingCarts;
  }

  @override
  insert(ShoppingCart shoppingCart) {
    _box.put(shoppingCart);
  }

  @override
  update(ShoppingCart shoppingCart) {
    _box.put(shoppingCart);
  }
}
