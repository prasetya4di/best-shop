import 'package:my_marketplace/data/source/local/walkthrough_dao.dart';
import 'package:my_marketplace/repository/walkthrough_repository.dart';

class WalkthroughRepositoryImpl implements WalkthroughRepository {
  final WalkthroughDao _walkthroughDao;

  WalkthroughRepositoryImpl(this._walkthroughDao);

  @override
  bool isFinished() => _walkthroughDao.isFinished();

  @override
  update(bool isFinished) {
    _walkthroughDao.update(isFinished);
  }
}
