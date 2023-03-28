import 'package:my_marketplace/domain/update_walkthrough_status.dart';

class WalkthroughViewModel {
  final UpdateWalkthroughStatus _updateWalkthroughStatus;

  WalkthroughViewModel(this._updateWalkthroughStatus);

  updateWalkthroughStatus() {
    _updateWalkthroughStatus(true);
  }
}
