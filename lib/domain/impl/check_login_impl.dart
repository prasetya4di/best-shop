import 'package:my_marketplace/domain/check_login.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class CheckLoginImpl implements CheckLogin {
  final UserRepository _repository;

  CheckLoginImpl(this._repository);

  @override
  bool call() => _repository.isLoggedIn();
}
