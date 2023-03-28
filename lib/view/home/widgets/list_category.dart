import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/category.dart';

class ListCategory extends StatelessWidget {
  final List<Category> categories;

  const ListCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, index) {
            var category = categories[index];

            return Card(
              margin: const EdgeInsets.only(left: 12, bottom: 8),
              elevation: 3,
              child: Container(
                  constraints: const BoxConstraints(minWidth: 105),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(category.iconPath, width: 48),
                      const Spacer(),
                      Text(category.name)
                    ],
                  )),
            );
          }),
    );
  }
}
