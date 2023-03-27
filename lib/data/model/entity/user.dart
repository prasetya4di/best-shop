import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/shopping_cart.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User extends Equatable {
  @Id()
  final int obxId;
  final String email;
  final String name;
  final String address;
  final DateTime birthDate;
  final String _password;
  final bool isDoneOnBoarding;
  @Backlink('shopping_cart')
  final shoppingCarts = ToMany<ShoppingCart>();
  @Backlink('order')
  final orders = ToMany<Order>();

  User(this.email, this.name, this.address, this.birthDate, this._password,
      this.isDoneOnBoarding,
      {this.obxId = 0});

  @override
  List<Object?> get props =>
      [email, name, address, birthDate, _password, isDoneOnBoarding];
}
