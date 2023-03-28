import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/domain/get_category_by_id.dart';
import 'package:my_marketplace/repository/category_repository.dart';

class GetCategoryByIdImpl implements GetCategoryById {
  final CategoryRepository _repository;

  GetCategoryByIdImpl(this._repository);

  @override
  Category? call(int id) => _repository.getById(id);
}
