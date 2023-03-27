import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';

abstract class OrderDao {
  insert(UserOrder userOrder, List<OrderDetail> orderDetails);

  update(UserOrder userOrder);

  updateProduct(UserOrder userOrder, OrderDetail orderDetail);

  List<UserOrder> get(User user);

  delete(int id);

  deleteProducts(UserOrder userOrder, OrderDetail orderDetail);
}
