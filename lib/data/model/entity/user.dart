import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:my_marketplace/data/model/entity/user_order.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User extends Equatable {
  @Id()
  int obxId;
  String email;
  String name;
  String address;
  @Property(type: PropertyType.date)
  DateTime birthDate;
  String password;
  bool isDoneOnBoarding;
  @Backlink()
  final shoppingCarts = ToMany<ShoppingCart>();
  @Backlink()
  final orders = ToMany<UserOrder>();

  User(this.email, this.name, this.address, this.birthDate, this.password,
      this.isDoneOnBoarding,
      {this.obxId = 0});

  @override
  List<Object?> get props =>
      [email, name, address, birthDate, password, isDoneOnBoarding];
}
