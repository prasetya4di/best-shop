import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Order extends Equatable {
  @Id()
  final int obxId;
  final customer = ToOne<User>();
  final int totalStok;
  final double totalPrice;
  final DateTime createdDate;

  Order(this.totalStok, this.totalPrice, this.createdDate, {this.obxId = 0});

  @override
  List<Object?> get props =>
      [customer.targetId, totalStok, totalPrice, createdDate];
}
