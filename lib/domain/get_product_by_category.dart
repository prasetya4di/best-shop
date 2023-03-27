import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';

abstract class GetProductByCategory {
  List<Product> call(Category category);
}
