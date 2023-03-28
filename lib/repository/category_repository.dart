import 'package:my_marketplace/data/model/entity/category.dart';

abstract class CategoryRepository {
  insert(Category category);

  inserts(List<Category> categories);

  List<Category> get();

  Category? getById(int id);

  clear();
}
