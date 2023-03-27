import 'package:my_marketplace/data/model/entity/user.dart';

abstract class Register {
  User? call(User newUser);
}
