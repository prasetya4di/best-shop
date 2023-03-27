import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:my_marketplace/data/source/local/order_dao.dart';
import 'package:my_marketplace/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDao _orderDao;

  OrderRepositoryImpl(this._orderDao);

  @override
  delete(int id) {
    _orderDao.delete(id);
  }

  @override
  List<UserOrder> get(User user) => _orderDao.get(user);

  @override
  update(UserOrder userOrder) {
    _orderDao.update(userOrder);
  }

  @override
  deleteProducts(UserOrder userOrder, OrderDetail orderDetail) {
    _orderDao.deleteProducts(userOrder, orderDetail);
  }

  @override
  insert(UserOrder userOrder, List<OrderDetail> orderDetails) {
    _orderDao.insert(userOrder, orderDetails);
  }

  @override
  updateProduct(UserOrder userOrder, OrderDetail orderDetail) {
    _orderDao.updateProduct(userOrder, orderDetail);
  }
}
