import 'package:my_marketplace/data/model/entity/category.dart';

abstract class SearchProduct {
  call(String keyword, {Category? category});
}
