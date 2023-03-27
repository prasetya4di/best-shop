import 'package:equatable/equatable.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Product extends Equatable {
  @Id()
  final int obxId;
  final category = ToOne<Category>();
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final int stock;
  final DateTime createdDate;

  Product(this.name, this.imagePath, this.price, this.stock, this.createdDate,
      this.description,
      {this.obxId = 0});

  @override
  List<Object?> get props => [
        category.targetId,
        name,
        description,
        imagePath,
        price,
        stock,
        createdDate
      ];
}
