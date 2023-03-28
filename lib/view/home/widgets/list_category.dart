import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';

class ListCategory extends StatelessWidget {
  final List<Category> categories;

  const ListCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextTitle.medium(text: S.of(context).textCategory),
        ),
        SizedBox(
          height: 105,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, index) {
                var category = categories[index];

                return InkWell(
                  onTap: () {
                    //Todo navigate to list item with category
                  },
                  child: Card(
                    margin: const EdgeInsets.only(left: 12, bottom: 8),
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
                  ),
                );
              }),
        ),
      ],
    );
  }
}
