import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:my_marketplace/data/source/local/order_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class OrderDaoImpl implements OrderDao {
  final Box<UserOrder> _box;

  OrderDaoImpl(this._box);

  @override
  delete(int id) {
    _box.remove(id);
  }

  @override
  List<UserOrder> get(User user) {
    Query<UserOrder> query =
        _box.query(UserOrder_.customer.equals(user.obxId)).build();
    List<UserOrder> userOrders = query.find();
    query.close();

    return userOrders;
  }

  @override
  insert(UserOrder userOrder) {
    _box.put(userOrder);
  }

  @override
  update(UserOrder userOrder) {
    _box.put(userOrder);
  }
}
