import 'package:my_marketplace/domain/check_login.dart';
import 'package:my_marketplace/domain/check_walkthrough_status.dart';
import 'package:my_marketplace/util/constants/routes.dart';

class SplashViewModel {
  final CheckWalkthroughStatus _checkWalkthroughStatus;
  final CheckLogin _checkLogin;

  SplashViewModel(this._checkWalkthroughStatus, this._checkLogin);

  String? _nextRoute;

  getNextPage() {
    bool isWalkthroughFinish = _checkWalkthroughStatus.call();
    if (isWalkthroughFinish) {
      bool isLoggedIn = _checkLogin.call();
      if (isLoggedIn) {
        _nextRoute = Routes.home;
      } else {
        _nextRoute = Routes.login;
      }
    } else {
      _nextRoute = Routes.walkthrough;
    }

    return _nextRoute;
  }
}
