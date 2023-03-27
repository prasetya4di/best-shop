import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/order_detail.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserOrder extends Equatable {
  @Id()
  int obxId;
  final customer = ToOne<User>();
  int totalStock;
  double totalPrice;
  @Property(type: PropertyType.dateNano)
  DateTime createdDate;
  @Backlink()
  final products = ToMany<OrderDetail>();

  UserOrder(this.totalStock, this.totalPrice, this.createdDate,
      {this.obxId = 0});

  @override
  List<Object?> get props =>
      [customer.targetId, totalStock, totalPrice, createdDate];
}
