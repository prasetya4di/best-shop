import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/register.dart';
import 'package:my_marketplace/view/register/viewmodel/register_state.dart';

class RegisterViewModel extends ChangeNotifier {
  final Register _register;

  RegisterViewModel(this._register);

  RegisterState _registerState = RegisterStateIdle();

  RegisterState get registerState => _registerState;

  register(String email, String name, String address, String password,
      DateTime birthDate) {
    User? user = _register
        .call(User(email, name, address, birthDate, password, false, true));
    if (user != null) {
      _registerState = RegisterStateSuccess();
    } else {
      _registerState = RegisterStateError();
    }

    notifyListeners();
  }
}
