import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';

abstract class OrderDetailRepository {
  insert(OrderDetail orderDetail);

  inserts(List<OrderDetail> orderDetails);

  update(OrderDetail orderDetail);

  List<OrderDetail> get(UserOrder order);

  delete(int id);
}
