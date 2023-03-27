import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_products.dart';
import 'package:my_marketplace/repository/product_repository.dart';

class GetProductsImpl implements GetProducts {
  final ProductRepository _repository;

  GetProductsImpl(this._repository);

  @override
  List<Product> call() => _repository.get();
}
