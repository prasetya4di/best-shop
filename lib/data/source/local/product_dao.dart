import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';

abstract class ProductDao {
  insert(Product product);

  inserts(List<Product> products);

  List<Product> get();

  List<Product> getByCategory(Category category);

  Product? getById(int id);
}
