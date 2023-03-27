import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/source/local/user_dao.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  UserRepositoryImpl(this._userDao);

  @override
  User get() => _userDao.get();

  @override
  User? login(String email, String password) => _userDao.login(email, password);

  @override
  logout(User user) {
    _userDao.logout(user);
  }

  @override
  User? register(User newUser) => _userDao.register(newUser);

  @override
  User update(User user) => _userDao.update(user);
}
