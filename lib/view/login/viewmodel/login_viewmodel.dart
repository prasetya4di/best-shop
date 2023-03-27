import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/login.dart';
import 'package:my_marketplace/view/login/viewmodel/login_state.dart';

class LoginViewModel extends ChangeNotifier {
  final Login _login;

  LoginViewModel(this._login);

  LoginState _loginState = LoginStateIdle();

  LoginState get loginState => _loginState;

  login(String email, String password) {
    _loginState = LoginStateLoading();
    notifyListeners();

    User? user = _login.call(email, password);

    if (user == null) {
      _loginState = LoginStateError();
    } else {
      _loginState = LoginStateSuccess();
    }

    notifyListeners();
  }
}
