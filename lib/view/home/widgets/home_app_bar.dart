import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/space_horizontal.dart';

class HomeAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TextEditingController filter;

  HomeAppBar(this.expandedHeight, this.filter);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var colorFilter =
        const ColorFilter.mode(AssetColors.ghostWhite, BlendMode.srcIn);
    var defaultInputBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AssetColors.gray100));

    return Stack(
      children: [
        Column(
          children: [
            if (shrinkOffset < kToolbarHeight)
              Container(
                color: Colors.yellow,
                child: const Center(
                  child: Text("Banner 1"),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              color: AssetColors.blue100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.imagesLogoWhite, width: 36),
                      const SpaceHorizontal(),
                      const Text("Best Shop",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.imagesIcShoppingCart,
                          colorFilter: colorFilter),
                      SvgPicture.asset(Assets.imagesIcUser,
                          colorFilter: colorFilter)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: shrinkOffset < 60
                ? MediaQuery.of(context).size.width - shrinkOffset
                : MediaQuery.of(context).size.width - 64,
            child: TextField(
                controller: filter,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AssetColors.gray100,
                    hintText: S.of(context).textSearch,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 18),
                    border: defaultInputBorder,
                    enabledBorder: defaultInputBorder,
                    suffixIcon: const Icon(Icons.search))),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 16;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
