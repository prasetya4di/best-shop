import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ShoppingCart extends Equatable {
  @Id()
  int obxId;
  final customer = ToOne<User>();
  final products = ToOne<Product>();
  int totalStock;
  double totalPrice;

  ShoppingCart(this.totalStock, this.totalPrice, {this.obxId = 0});

  @override
  List<Object?> get props =>
      [customer.targetId, products.targetId, totalStock, totalPrice];
}
