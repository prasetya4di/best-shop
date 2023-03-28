import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/util/constants/font.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/home/home_screen.dart';
import 'package:my_marketplace/view/home/viewmodel/home_viewmodel.dart';
import 'package:my_marketplace/view/login/login_screen.dart';
import 'package:my_marketplace/view/login/viewmodel/login_viewmodel.dart';
import 'package:my_marketplace/view/product_detail/product_detail_screen.dart';
import 'package:my_marketplace/view/product_detail/viewmodel/product_detail_viewmodel.dart';
import 'package:my_marketplace/view/product_per_category/product_per_category_screen.dart';
import 'package:my_marketplace/view/product_per_category/viewmodel/product_per_category_viewmodel.dart';
import 'package:my_marketplace/view/profile/profile_screen.dart';
import 'package:my_marketplace/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:my_marketplace/view/register/register_screen.dart';
import 'package:my_marketplace/view/register/viewmodel/register_viewmodel.dart';
import 'package:my_marketplace/view/splash/splash_screen.dart';
import 'package:my_marketplace/view/splash/viewmodel/splash_view_model.dart';
import 'package:my_marketplace/view/walkthrough/viewmodel/walkthrough_viewmodel.dart';
import 'package:my_marketplace/view/walkthrough/walkthrough_screen.dart';
import 'package:provider/provider.dart';

import 'core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
            create: (context) => SplashViewModel(di.get(), di.get(), di.get())),
        Provider(create: (context) => WalkthroughViewModel(di.get())),
        ChangeNotifierProvider(create: (context) => LoginViewModel(di.get())),
        ChangeNotifierProvider(
            create: (context) => RegisterViewModel(di.get())),
        ChangeNotifierProvider(
            create: (context) => ProfileViewModel(di.get(), di.get())),
        ChangeNotifierProvider(
            create: (context) =>
                HomeViewModel(di.get(), di.get(), di.get(), di.get())),
        ChangeNotifierProvider(
            create: (context) => ProductDetailViewModel(di.get(), di.get())),
        ChangeNotifierProvider(
            create: (context) =>
                ProductPerCategoryViewModel(di.get(), di.get())),
      ],
      child: MaterialApp.router(
        title: 'Best Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: poppins,
        ),
        routerConfig: _router,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: Routes.walkthrough,
        builder: (context, state) => const WalkthroughScreen()),
    GoRoute(
        path: Routes.login, builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: Routes.detailProduct,
        builder: (context, state) => ProductDetailScreen(
            productId: int.parse(state.params['productId'] ?? "0"))),
    GoRoute(
        path: Routes.detailCategory,
        builder: (context, state) => ProductPerCategoryScreen(
            categoryId: int.parse(state.params['categoryId'] ?? "0"))),
  ],
);
