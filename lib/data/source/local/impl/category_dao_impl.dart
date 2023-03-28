import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/source/local/category_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class CategoryDaoImpl implements CategoryDao {
  final Box<Category> _box;

  CategoryDaoImpl(this._box);

  @override
  List<Category> get() {
    return _box.getAll();
  }

  @override
  insert(Category category) {
    _box.put(category);
  }

  @override
  inserts(List<Category> categories) {
    _box.putMany(categories);
  }

  @override
  clear() {
    _box.removeAll();
  }
}
