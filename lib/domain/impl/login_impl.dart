import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/login.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class LoginImpl implements Login {
  final UserRepository _repository;

  LoginImpl(this._repository);

  @override
  User? call(String email, String password) {
    User? user = _repository.login(email, password);
    if (user == null) {
      return null;
    } else {
      user.isLoggedIn = true;
      _repository.update(user);
      return user;
    }
  }
}
