import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/source/local/category_dao.dart';
import 'package:my_marketplace/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDao _categoryDao;

  CategoryRepositoryImpl(this._categoryDao);

  @override
  List<Category> get() => _categoryDao.get();

  @override
  insert(Category category) {
    _categoryDao.insert(category);
  }

  @override
  inserts(List<Category> categories) {
    _categoryDao.inserts(categories);
  }
}
