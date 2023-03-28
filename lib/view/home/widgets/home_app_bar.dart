import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/home/widgets/search_bar.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/space_horizontal.dart';

class HomeAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TextEditingController filter;
  final Function(String) onSearchChanged;

  HomeAppBar(this.expandedHeight, this.filter, this.onSearchChanged);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var defaultInputBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AssetColors.gray100));

    return Stack(
      children: [
        Column(
          children: [
            if (shrinkOffset < kToolbarHeight)
              Container(
                color: Colors.green,
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
                      appBarIcon(Assets.imagesIcShoppingCart, () {}),
                      const SpaceHorizontal(),
                      appBarIcon(Assets.imagesIcUser, () {
                        context.push(Routes.profile);
                      }),
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
                ? MediaQuery
                .of(context)
                .size
                .width - shrinkOffset
                : MediaQuery
                .of(context)
                .size
                .width - 64,
            child: SearchBar(filter: filter, onSearchChanged: onSearchChanged),
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

extension HomeAppBarIcon on HomeAppBar {
  Widget appBarIcon(String asset, Function() onClick) {
    var colorFilter =
        const ColorFilter.mode(AssetColors.ghostWhite, BlendMode.srcIn);
    return InkWell(
        onTap: onClick,
        child: SvgPicture.asset(asset, colorFilter: colorFilter));
  }
}
