import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Category extends Equatable {
  @Id()
  int obxId;
  final String name;
  final String iconPath;
  @Backlink()
  final products = ToMany<Product>();

  Category(this.name, this.iconPath, {this.obxId = 0});

  @override
  List<Object?> get props => [name, iconPath];
}
