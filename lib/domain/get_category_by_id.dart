import 'package:my_marketplace/data/model/entity/category.dart';

abstract class GetCategoryById {
  Category? call(int id);
}
