import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:my_marketplace/data/source/local/order_detail_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class OrderDetailDaoImpl implements OrderDetailDao {
  final Box<OrderDetail> _box;

  OrderDetailDaoImpl(this._box);

  @override
  delete(int id) {
    _box.remove(id);
  }

  @override
  List<OrderDetail> get(UserOrder userOrder) {
    Query<OrderDetail> query =
        _box.query(OrderDetail_.order.equals(userOrder.obxId)).build();
    List<OrderDetail> orderDetails = query.find();
    query.close();

    return orderDetails;
  }

  @override
  insert(OrderDetail orderDetail) {
    _box.put(orderDetail);
  }

  @override
  update(OrderDetail orderDetail) {
    _box.put(orderDetail);
  }

  @override
  inserts(List<OrderDetail> orderDetails) {
    _box.putMany(orderDetails);
  }
}
