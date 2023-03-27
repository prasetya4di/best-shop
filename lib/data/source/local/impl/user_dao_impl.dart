import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/source/local/user_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class UserDaoImpl implements UserDao {
  final Box<User> _box;

  UserDaoImpl(this._box);

  @override
  User get() {
    Query<User> query = _box.query(User_.isLoggedIn.equals(true)).build();
    User user = query.findFirst()!;
    query.close();
    return user;
  }

  @override
  User? login(String email, String password) {
    Query<User> query = _box
        .query(User_.email.equals(email).and(User_.password.equals(password)))
        .build();
    User? user = query.findFirst();
    query.close();
    return user;
  }

  @override
  logout(User user) {
    user.isLoggedIn = false;
    _box.put(user);
  }

  @override
  User? register(User newUser) {
    Query<User> query = _box.query(User_.email.equals(newUser.email)).build();
    User? user = query.findFirst();
    query.close();

    if (user != null) {
      return null;
    } else {
      int id = _box.put(newUser);
      newUser.obxId = id;
    }

    return newUser;
  }

  @override
  User update(User user) {
    _box.put(user);
    return user;
  }

  @override
  bool isLoggedIn() {
    Query<User> query = _box.query(User_.isLoggedIn.equals(true)).build();
    User? user = query.findFirst();
    query.close();

    return user != null;
  }
}
