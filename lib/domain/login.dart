import 'package:my_marketplace/data/model/entity/user.dart';

abstract class Login {
  User? call(String email, String password);
}
