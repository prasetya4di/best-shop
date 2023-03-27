import 'package:my_marketplace/domain/update_walkthrough_status.dart';
import 'package:my_marketplace/repository/walkthrough_repository.dart';

class UpdateWalkthroughStatusImpl implements UpdateWalkthroughStatus {
  final WalkthroughRepository _repository;

  UpdateWalkthroughStatusImpl(this._repository);

  @override
  call(bool isFinish) {
    _repository.update(isFinish);
  }
}
