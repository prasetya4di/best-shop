import 'package:flutter/cupertino.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/domain/get_user.dart';
import 'package:my_marketplace/domain/logout.dart';
import 'package:my_marketplace/view/profile/viewmodel/profile_state.dart';

class ProfileViewModel extends ChangeNotifier {
  final GetUser _getUser;
  final Logout _logout;

  ProfileViewModel(this._getUser, this._logout);

  User? _user;
  ProfileState _state = ProfileIdleState();

  User? get user => _user;

  ProfileState get state => _state;

  getUser() {
    _state = ProfileLoadingState();
    notifyListeners();

    _user = _getUser.call();
    _state = ProfileSuccessState();
    notifyListeners();
  }

  logout() {
    _logout.call(user!);
    _state = ProfileLogoutState();
    notifyListeners();
  }
}
