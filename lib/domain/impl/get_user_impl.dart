import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/get_user.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class GetUserImpl implements GetUser {
  final UserRepository _repository;

  GetUserImpl(this._repository);

  @override
  User call() => _repository.get();
}
