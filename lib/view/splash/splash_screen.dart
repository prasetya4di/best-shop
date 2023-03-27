import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/view/splash/viewmodel/splash_view_model.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String nextRoute = context.read<SplashViewModel>().getNextPage();
      context.pushReplacement(nextRoute);
    });

    return Scaffold(
      backgroundColor: AssetColors.blue100,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesLogoWhite, width: 12 * 15),
            const SpaceVertical(),
            const Text("Best Shop",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
            const SpaceVertical(),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
