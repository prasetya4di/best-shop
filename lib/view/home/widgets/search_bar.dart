import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/input_border.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController filter;
  final Function(String) onSearchChanged;

  const SearchBar(
      {super.key, required this.filter, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: filter,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
            filled: true,
            fillColor: AssetColors.gray100,
            hintText: S.of(context).textSearch,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            border: defaultInputBorder,
            enabledBorder: defaultInputBorder,
            suffixIcon: IconButton(
                onPressed: () {
                  if (filter.value.text.isNotEmpty) {
                    filter.clear();
                    onSearchChanged("");
                  }
                },
                icon: filter.value.text.isNotEmpty
                    ? const Icon(Icons.close)
                    : const Icon(Icons.search))));
  }
}
