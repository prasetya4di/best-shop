import 'package:my_marketplace/data/model/entity/product.dart';

abstract class GetProductById {
  Product? call(int id);
}
