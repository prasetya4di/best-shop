import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Order extends Equatable {
  @Id()
  final int obxId;
  final customer = ToOne<User>();
  final int totalStock;
  final double totalPrice;
  final DateTime createdDate;
  @Backlink('order_detail')
  final products = ToMany<OrderDetail>();

  Order(this.totalStock, this.totalPrice, this.createdDate, {this.obxId = 0});

  @override
  List<Object?> get props =>
      [customer.targetId, totalStock, totalPrice, createdDate];
}
