import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:my_marketplace/data/source/local/order_detail_dao.dart';
import 'package:my_marketplace/repository/order_detail_repository.dart';

class OrderDetailRepositoryImpl implements OrderDetailRepository {
  final OrderDetailDao _orderDetailDao;

  OrderDetailRepositoryImpl(this._orderDetailDao);

  @override
  delete(int id) {
    _orderDetailDao.delete(id);
  }

  @override
  List<OrderDetail> get(UserOrder order) => _orderDetailDao.get(order);

  @override
  insert(OrderDetail orderDetail) {
    _orderDetailDao.insert(orderDetail);
  }

  @override
  update(OrderDetail orderDetail) {
    _orderDetailDao.update(orderDetail);
  }

  @override
  inserts(List<OrderDetail> orderDetails) {
    _orderDetailDao.inserts(orderDetails);
  }
}
