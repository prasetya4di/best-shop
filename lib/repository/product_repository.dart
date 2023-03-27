import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';

abstract class ProductRepository {
  insert(Product product);

  inserts(List<Product> products);

  List<Product> get();

  List<Product> getByCategory(Category category);

  Product? getById(int id);

  List<Product> searchProduct(String keyword);

  List<Product> searchProductInCategory(String keyword, Category category);
}
