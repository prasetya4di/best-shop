import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/domain/get_categories.dart';
import 'package:my_marketplace/repository/category_repository.dart';

class GetCategoriesImpl implements GetCategories {
  final CategoryRepository _repository;

  GetCategoriesImpl(this._repository);

  @override
  List<Category> call() => _repository.get();
}
