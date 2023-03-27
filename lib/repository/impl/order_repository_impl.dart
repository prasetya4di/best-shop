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
  List<UserOrder> get(User user) {
    return _orderDao.get(user);
  }

  @override
  insert(UserOrder userOrder) {
    _orderDao.insert(userOrder);
  }

  @override
  update(UserOrder userOrder) {
    _orderDao.update(userOrder);
  }
}
