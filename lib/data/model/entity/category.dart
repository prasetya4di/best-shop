import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/product.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Category extends Equatable {
  @Id()
  final int obxId;
  final String name;
  @Backlink('product')
  final products = ToMany<Product>();

  Category(this.name, {this.obxId = 0});

  @override
  List<Object?> get props => [name];
}
