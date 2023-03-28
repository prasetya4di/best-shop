import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/logout.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class LogoutImpl implements Logout {
  final UserRepository _repository;

  LogoutImpl(this._repository);

  @override
  call(User user) {
    user.isLoggedIn = false;
    _repository.update(user);
  }
}
