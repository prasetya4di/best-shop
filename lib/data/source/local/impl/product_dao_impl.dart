import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/source/local/product_dao.dart';
import 'package:my_marketplace/objectbox.g.dart';

class ProductDaoImpl implements ProductDao {
  final Box<Product> _box;

  ProductDaoImpl(this._box);

  @override
  List<Product> get() {
    return _box.getAll();
  }

  @override
  List<Product> getByCategory(Category category) {
    Query<Product> query =
        _box.query(Product_.category.equals(category.obxId)).build();
    List<Product> products = query.find();
    query.close();

    return products;
  }

  @override
  Product? getById(int id) {
    return _box.get(id);
  }

  @override
  insert(Product product) {
    _box.put(product);
  }

  @override
  inserts(List<Product> products) {
    _box.putMany(products);
  }

  @override
  List<Product> searchProduct(String keyword) {
    Query<Product> query = _box
        .query(Product_.name
            .contains(keyword)
            .or(Product_.description.contains(keyword)))
        .build();
    List<Product> products = query.find();
    query.close();

    return products;
  }

  @override
  List<Product> searchProductInCategory(String keyword, Category category) {
    Query<Product> query = _box
        .query(Product_.category.equals(category.obxId).and(Product_.name
            .contains(keyword)
            .or(Product_.description.contains(keyword))))
        .build();
    List<Product> products = query.find();
    query.close();

    return products;
  }
}
