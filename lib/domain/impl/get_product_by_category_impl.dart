import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_product_by_category.dart';
import 'package:my_marketplace/repository/product_repository.dart';

class GetProductByCategoryImpl implements GetProductByCategory {
  final ProductRepository _repository;

  GetProductByCategoryImpl(this._repository);

  @override
  List<Product> call(Category category) => _repository.getByCategory(category);
}
