import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OrderDetail extends Equatable {
  @Id()
  final int obxId;
  final order = ToOne<Order>();
  final product = ToOne<Product>();
  final int totalStok;
  final double totalPrice;

  OrderDetail(this.totalStok, this.totalPrice, {this.obxId = 0});

  @override
  List<Object?> get props =>
      [order.targetId, product.targetId, totalStok, totalPrice];
}
