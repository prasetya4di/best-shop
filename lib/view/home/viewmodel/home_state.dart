import 'package:my_marketplace/data/model/entity/product.dart';

abstract class HomeState {}

class HomeIdleState extends HomeState {}

class HomeLoadProductsState extends HomeState {}

class HomeProductsLoadedState extends HomeState {}

class HomeProductsSearchedState extends HomeState {
  final List<Product> products;

  HomeProductsSearchedState(this.products);
}
