import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OrderDetail extends Equatable {
  @Id()
  int obxId;
  final order = ToOne<UserOrder>();
  final product = ToOne<Product>();
  int totalStock;
  double totalPrice;

  OrderDetail(this.totalStock, this.totalPrice, {this.obxId = 0});

  @override
  List<Object?> get props =>
      [order.targetId, product.targetId, totalStock, totalPrice];
}
