import 'dart:math';

import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/domain/initialize_products.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/repository/category_repository.dart';

class InitializeProductsImpl implements InitializeProducts {
  final CategoryRepository _repository;

  InitializeProductsImpl(this._repository);

  @override
  call() {
    Category electronic = generateCategoryWithProducts("Electronic");
    Category furniture = generateCategoryWithProducts("Furniture");
    Category clothing = generateCategoryWithProducts("Clothing");
    Category beauty = generateCategoryWithProducts("Beauty");
    Category sports = generateCategoryWithProducts("Sport");
    List<Category> categories = [
      electronic,
      furniture,
      clothing,
      beauty,
      sports
    ];
    _repository.inserts(categories);
  }

  Category generateCategoryWithProducts(String name) {
    Category category = Category(name);
    List<Product> productCategory = generateRandomProducts(category);
    category.products.addAll(productCategory);
    return category;
  }

  List<Product> generateRandomProducts(Category category) {
    final random = Random();

    List<String> productNames = List.generate(
      20,
      (i) => 'Product ${category.name} ${i + 1}',
    );

    List<String> descriptions = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.',
      'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis.',
      'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
      'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.',
    ];

    List<String> imagePaths = [
      Assets.imagesProduct1,
      Assets.imagesProduct2,
      Assets.imagesProduct3,
      Assets.imagesProduct4,
      Assets.imagesProduct5,
      Assets.imagesProduct6,
      Assets.imagesProduct7,
      Assets.imagesProduct8,
      Assets.imagesProduct9,
      Assets.imagesProduct10,
    ];

    List<Product> products = List.generate(
      10,
      (i) => Product(
        productNames[random.nextInt(productNames.length)],
        imagePaths[random.nextInt(imagePaths.length)],
        double.parse((10 + random.nextDouble() * 990).toStringAsFixed(2)),
        random.nextInt(100) + 1,
        DateTime.now().subtract(Duration(days: random.nextInt(365))),
        '${descriptions[random.nextInt(descriptions.length)]} ${category.name} product.',
      ),
    );

    return products;
  }
}
