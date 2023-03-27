import 'package:my_marketplace/data/model/entity/user.dart';

abstract class UserDao {
  User? login(String email, String password);

  User? register(User newUser);

  User get();

  User update(User user);

  logout(User user);
}