import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_category_by_id.dart';
import 'package:my_marketplace/domain/get_product_by_category.dart';
import 'package:my_marketplace/view/product_per_category/viewmodel/product_per_category_state.dart';

class ProductPerCategoryViewModel extends ChangeNotifier {
  final GetCategoryById _getCategoryById;
  final GetProductByCategory _getProductByCategory;

  ProductPerCategoryViewModel(
      this._getProductByCategory, this._getCategoryById);

  ProductPerCategoryState _state = ProductIdleState();
  Category? _category;
  List<Product> _products = [];

  ProductPerCategoryState get state => _state;

  Category? get category => _category;

  List<Product> get products => _products;

  getProduct(int categoryId) {
    _state = ProductLoadingState();
    notifyListeners();

    _category = _getCategoryById(categoryId);
    if (_category == null) {
      _state = CategoryNotFoundState();
    } else {
      _products = _getProductByCategory(_category!);
      _state =
          _products.isNotEmpty ? ProductLoadedState() : ProductEmptyState();
    }
    notifyListeners();
  }
}
