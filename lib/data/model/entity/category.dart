import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Category extends Equatable {
  @Id()
  final int obxId;
  final String name;

  const Category(this.name, {this.obxId = 0});

  @override
  List<Object?> get props => [name];
}
