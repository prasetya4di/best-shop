import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/get_product_by_id.dart';
import 'package:my_marketplace/view/product_detail/viewmodel/product_detail_state.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final GetProductById _getProductById;

  ProductDetailViewModel(this._getProductById);

  ProductDetailState _state = ProductIdleState();
  Product? _product;

  ProductDetailState get state => _state;

  Product? get product => _product;

  init() {
    _state = ProductIdleState();
    notifyListeners();
  }

  getProduct(int id) {
    _state = ProductLoadingState();
    notifyListeners();

    _product = _getProductById(id);
    _state = _product == null ? ProductNotFoundState() : ProductLoadedState();
    notifyListeners();
  }
}
