import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/register.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class RegisterImpl implements Register {
  final UserRepository _repository;

  RegisterImpl(this._repository);

  @override
  User? call(User newUser) => _repository.register(newUser);
}
