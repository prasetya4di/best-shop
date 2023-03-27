import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/util/constants/font.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/splash/splash_screen.dart';
import 'package:my_marketplace/view/splash/viewmodel/splash_view_model.dart';
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
        Provider(create: (context) => SplashViewModel(di.get(), di.get()))
      ],
      child: MaterialApp.router(
        title: 'Best Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: poppins,
        ),
        routerConfig: _router,
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
        builder: (context, state) => const WalkthroughScreen())
  ],
);
