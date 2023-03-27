import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_product_by_id.dart';
import 'package:my_marketplace/repository/product_repository.dart';

class GetProductByIdImpl implements GetProductById {
  final ProductRepository _repository;

  GetProductByIdImpl(this._repository);

  @override
  Product? call(int id) => _repository.getById(id);
}
