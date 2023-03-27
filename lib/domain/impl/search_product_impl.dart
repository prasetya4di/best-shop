import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/domain/search_product.dart';
import 'package:my_marketplace/repository/product_repository.dart';

class SearchProductImpl implements SearchProduct {
  final ProductRepository _repository;

  SearchProductImpl(this._repository);

  @override
  call(String keyword, {Category? category}) => category != null
      ? _repository.searchProductInCategory(keyword, category)
      : _repository.searchProduct(keyword);
}
