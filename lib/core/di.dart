import 'package:get_it/get_it.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:my_marketplace/data/model/entity/walkthrough.dart';
import 'package:my_marketplace/data/source/local/category_dao.dart';
import 'package:my_marketplace/data/source/local/impl/category_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/order_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/order_detail_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/product_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/shopping_cart_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/user_dao_impl.dart';
import 'package:my_marketplace/data/source/local/impl/walkthrough_dao_impl.dart';
import 'package:my_marketplace/data/source/local/objectbox.dart';
import 'package:my_marketplace/data/source/local/order_dao.dart';
import 'package:my_marketplace/data/source/local/order_detail_dao.dart';
import 'package:my_marketplace/data/source/local/product_dao.dart';
import 'package:my_marketplace/data/source/local/shopping_cart_dao.dart';
import 'package:my_marketplace/data/source/local/user_dao.dart';
import 'package:my_marketplace/data/source/local/walkthrough_dao.dart';
import 'package:my_marketplace/domain/check_login.dart';
import 'package:my_marketplace/domain/check_onboarding_status.dart';
import 'package:my_marketplace/domain/check_walkthrough_status.dart';
import 'package:my_marketplace/domain/get_categories.dart';
import 'package:my_marketplace/domain/get_product_by_category.dart';
import 'package:my_marketplace/domain/get_product_by_id.dart';
import 'package:my_marketplace/domain/get_products.dart';
import 'package:my_marketplace/domain/get_user.dart';
import 'package:my_marketplace/domain/impl/check_login_impl.dart';
import 'package:my_marketplace/domain/impl/check_onboarding_status_impl.dart';
import 'package:my_marketplace/domain/impl/check_walkthrough_status_impl.dart';
import 'package:my_marketplace/domain/impl/get_categories_impl.dart';
import 'package:my_marketplace/domain/impl/get_product_by_category_impl.dart';
import 'package:my_marketplace/domain/impl/get_product_by_id_impl.dart';
import 'package:my_marketplace/domain/impl/get_products_impl.dart';
import 'package:my_marketplace/domain/impl/get_user_impl.dart';
import 'package:my_marketplace/domain/impl/login_impl.dart';
import 'package:my_marketplace/domain/impl/register_impl.dart';
import 'package:my_marketplace/domain/impl/search_product_impl.dart';
import 'package:my_marketplace/domain/impl/update_walkthrough_status_impl.dart';
import 'package:my_marketplace/domain/login.dart';
import 'package:my_marketplace/domain/register.dart';
import 'package:my_marketplace/domain/search_product.dart';
import 'package:my_marketplace/domain/update_walkthrough_status.dart';
import 'package:my_marketplace/objectbox.g.dart';
import 'package:my_marketplace/repository/category_repository.dart';
import 'package:my_marketplace/repository/impl/category_repository_impl.dart';
import 'package:my_marketplace/repository/impl/order_detail_repository_impl.dart';
import 'package:my_marketplace/repository/impl/order_repository_impl.dart';
import 'package:my_marketplace/repository/impl/product_repository_impl.dart';
import 'package:my_marketplace/repository/impl/shopping_cart_repository_impl.dart';
import 'package:my_marketplace/repository/impl/user_repository_impl.dart';
import 'package:my_marketplace/repository/impl/walkthrough_repository_impl.dart';
import 'package:my_marketplace/repository/order_detail_repository.dart';
import 'package:my_marketplace/repository/order_repository.dart';
import 'package:my_marketplace/repository/product_repository.dart';
import 'package:my_marketplace/repository/shopping_cart_repository.dart';
import 'package:my_marketplace/repository/user_repository.dart';
import 'package:my_marketplace/repository/walkthrough_repository.dart';

final di = GetIt.I;

Future<void> setupDI() async {
  // Object box
  final objectBox = await ObjectBox.create();
  di.registerSingleton<Box<Category>>(objectBox.store.box<Category>());
  di.registerSingleton<Box<OrderDetail>>(objectBox.store.box<OrderDetail>());
  di.registerSingleton<Box<Product>>(objectBox.store.box<Product>());
  di.registerSingleton<Box<ShoppingCart>>(objectBox.store.box<ShoppingCart>());
  di.registerSingleton<Box<User>>(objectBox.store.box<User>());
  di.registerSingleton<Box<UserOrder>>(objectBox.store.box<UserOrder>());
  di.registerSingleton<Box<Walkthrough>>(objectBox.store.box<Walkthrough>());

  // Dao
  di.registerSingleton<CategoryDao>(CategoryDaoImpl(di.get()));
  di.registerSingleton<OrderDao>(OrderDaoImpl(di.get()));
  di.registerSingleton<OrderDetailDao>(OrderDetailDaoImpl(di.get()));
  di.registerSingleton<ProductDao>(ProductDaoImpl(di.get()));
  di.registerSingleton<ShoppingCartDao>(ShoppingCartDaoImpl(di.get()));
  di.registerSingleton<UserDao>(UserDaoImpl(di.get()));
  di.registerSingleton<WalkthroughDao>(WalkthroughDaoImpl(di.get()));

  // Repository
  di.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(di.get()));
  di.registerSingleton<OrderDetailRepository>(
      OrderDetailRepositoryImpl(di.get()));
  di.registerSingleton<OrderRepository>(OrderRepositoryImpl(di.get()));
  di.registerSingleton<ProductRepository>(ProductRepositoryImpl(di.get()));
  di.registerSingleton<ShoppingCartRepository>(
      ShoppingCartRepositoryImpl(di.get()));
  di.registerSingleton<UserRepository>(UserRepositoryImpl(di.get()));
  di.registerSingleton<WalkthroughRepository>(
      WalkthroughRepositoryImpl(di.get()));

  // Use Case
  di.registerSingleton<CheckLogin>(CheckLoginImpl(di.get()));
  di.registerSingleton<CheckOnBoardingStatus>(
      CheckOnBoardingStatusImpl(di.get()));
  di.registerSingleton<CheckWalkthroughStatus>(
      CheckWalkthroughStatusImpl(di.get()));
  di.registerSingleton<GetCategories>(GetCategoriesImpl(di.get()));
  di.registerSingleton<GetProductByCategory>(
      GetProductByCategoryImpl(di.get()));
  di.registerSingleton<GetProductById>(GetProductByIdImpl(di.get()));
  di.registerSingleton<GetProducts>(GetProductsImpl(di.get()));
  di.registerSingleton<GetUser>(GetUserImpl(di.get()));
  di.registerSingleton<Login>(LoginImpl(di.get()));
  di.registerSingleton<Register>(RegisterImpl(di.get()));
  di.registerSingleton<SearchProduct>(SearchProductImpl(di.get()));
  di.registerSingleton<UpdateWalkthroughStatus>(
      UpdateWalkthroughStatusImpl(di.get()));
}
