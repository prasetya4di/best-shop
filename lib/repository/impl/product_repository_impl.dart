import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/source/local/product_dao.dart';
import 'package:my_marketplace/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDao _productDao;

  ProductRepositoryImpl(this._productDao);

  @override
  List<Product> get() => _productDao.get();

  @override
  List<Product> getByCategory(Category category) =>
      _productDao.getByCategory(category);

  @override
  Product? getById(int id) => _productDao.getById(id);

  @override
  insert(Product product) {
    _productDao.insert(product);
  }

  @override
  inserts(List<Product> products) {
    _productDao.inserts(products);
  }

  @override
  List<Product> searchProduct(String keyword) =>
      _productDao.searchProduct(keyword);

  @override
  List<Product> searchProductInCategory(String keyword, Category category) =>
      _productDao.searchProductInCategory(keyword, category);
}
