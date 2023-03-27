import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/walkthrough/viewmodel/walkthrough_viewmodel.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:provider/provider.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WalkthroughViewModel viewModel = context.read<WalkthroughViewModel>();
    TextStyle textStyle =
        const TextStyle(color: AssetColors.textBlack, fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              image: SvgPicture.asset(Assets.imagesWalkthrough1),
              title: S.of(context).titleWalkthrough1,
              body: S.of(context).descWalkthrough1),
          PageViewModel(
              image: SvgPicture.asset(Assets.imagesWalkthrough2),
              title: S.of(context).titleWalkthrough2,
              body: S.of(context).descWalkthrough2),
          PageViewModel(
              image: SvgPicture.asset(Assets.imagesWalkthrough3),
              title: S.of(context).titleWalkthrough3,
              body: S.of(context).descWalkthrough3),
          PageViewModel(
            image: SvgPicture.asset(Assets.imagesWalkthrough4),
            title: S.of(context).titleWalkthrough4,
            body: S.of(context).descWalkthrough4,
          )
        ],
        showSkipButton: true,
        skip: Text(S.of(context).textSkip, style: textStyle),
        next: Text(S.of(context).textNext, style: textStyle),
        done: Text(S.of(context).textDone, style: textStyle),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        onSkip: () {
          viewModel.updateWalkthroughStatus();
          context.pushReplacement(Routes.login);
        },
        onDone: () {
          viewModel.updateWalkthroughStatus();
          context.pushReplacement(Routes.login);
        },
      ),
    );
  }
}
