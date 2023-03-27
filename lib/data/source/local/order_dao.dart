import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';

abstract class OrderDao {
  insert(UserOrder userOrder);

  update(UserOrder userOrder);

  List<UserOrder> get(User user);

  delete(int id);
}
