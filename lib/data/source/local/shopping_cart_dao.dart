import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';

abstract class ShoppingCartDao {
  insert(ShoppingCart shoppingCart);

  List<ShoppingCart> get(User user);

  ShoppingCart? getByProductId(Product product);

  update(ShoppingCart shoppingCart);

  delete(int id);

  bool checkShoppingCartItem(User user);
}
