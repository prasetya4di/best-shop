import 'package:my_marketplace/domain/check_walkthrough_status.dart';
import 'package:my_marketplace/repository/walkthrough_repository.dart';

class CheckWalkthroughStatusImpl implements CheckWalkthroughStatus {
  final WalkthroughRepository _repository;

  CheckWalkthroughStatusImpl(this._repository);

  @override
  bool call() => _repository.isFinished();
}
