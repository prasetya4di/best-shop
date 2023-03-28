import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_categories.dart';
import 'package:my_marketplace/domain/get_products.dart';
import 'package:my_marketplace/domain/search_product.dart';
import 'package:my_marketplace/view/home/viewmodel/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final GetProducts _getProducts;
  final GetCategories _getCategories;
  final SearchProduct _searchProduct;

  HomeViewModel(this._getProducts, this._getCategories, this._searchProduct);

  HomeState _state = HomeIdleState();
  List<Category> _categories = [];
  List<Product> _products = [];

  HomeState get state => _state;

  List<Category> get categories => _categories;

  List<Product> get products => _products;

  init() {
    _state = HomeIdleState();
  }

  getProducts() {
    _state = HomeLoadProductsState();
    notifyListeners();

    _categories = _getCategories();
    _products = _getProducts();
    _state = HomeProductsLoadedState();
    notifyListeners();
  }

  searchProducts(String keyword) {
    _state = HomeLoadProductsState();
    notifyListeners();

    if (keyword.isNotEmpty) {
      _products = _searchProduct(keyword);
      _state = HomeProductsSearchedState(_products);
    } else {
      _products = _getProducts();
      _state = HomeProductsLoadedState();
    }
    notifyListeners();
  }
}
