import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';

abstract class ShoppingCartDao {
  insert(ShoppingCart shoppingCart);

  List<ShoppingCart> get(User user);

  update(ShoppingCart shoppingCart);

  delete(int id);

//Todo add function to count shopping cart total item
}
