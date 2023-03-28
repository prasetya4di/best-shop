import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesEmptySearch, width: 250),
            const SpaceVertical(),
            TextTitle.large(
                text: S.of(context).emptySearch,
                fontSize: 16,
                textAlign: TextAlign.center,
                maxLines: 5)
          ],
        ),
      ),
    );
  }
}
