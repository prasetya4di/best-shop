import 'package:equatable/equatable.dart';
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

  const User(this.email, this.name, this.address, this.birthDate,
      this._password, this.isDoneOnBoarding,
      {this.obxId = 0});

  @override
  List<Object?> get props =>
      [email, name, address, birthDate, _password, isDoneOnBoarding];
}
