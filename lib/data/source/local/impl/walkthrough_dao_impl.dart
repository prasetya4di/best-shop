import 'package:my_marketplace/data/model/entity/walkthrough.dart';
import 'package:my_marketplace/data/source/local/walkthrough_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class WalkthroughDaoImpl implements WalkthroughDao {
  final Box<Walkthrough> _box;

  WalkthroughDaoImpl(this._box);

  @override
  bool isFinished() {
    List<Walkthrough> walkthrough = _box.getAll();
    if (walkthrough.isNotEmpty) {
      return walkthrough.first.isFinished;
    } else {
      _box.put(Walkthrough(false));
      return false;
    }
  }

  @override
  update(bool isFinished) {
    _box.removeAll();
    _box.put(Walkthrough(isFinished));
  }
}
