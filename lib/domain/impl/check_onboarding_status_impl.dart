import 'package:my_marketplace/domain/check_onboarding_status.dart';
import 'package:my_marketplace/repository/user_repository.dart';

class CheckOnBoardingStatusImpl implements CheckOnBoardingStatus {
  final UserRepository _repository;

  CheckOnBoardingStatusImpl(this._repository);

  @override
  bool call() => _repository.get().isDoneOnBoarding;
}
