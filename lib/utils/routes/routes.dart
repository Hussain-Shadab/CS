import 'package:coffee_shop/utils/routes/routes_name.dart';
import 'package:coffee_shop/view/home_screen.dart';
import 'package:coffee_shop/view/item_detail_screen.dart';
import 'package:coffee_shop/view/order_screen.dart';
import 'package:coffee_shop/view/splash_onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        final args = settings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen(
              imgPath: args?['imgPath'] ?? 'assets/tiger.jpeg',
              imgtext: args?['imgtext'] ?? 'New Flayour',
            ));
      case RoutesName.splashOnbording:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashOnboardingScreen());
      case RoutesName.itemDetailScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const ItemDetailScreen());

      case RoutesName.orderScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const OrderScreen());

      default:

       return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Text('SomeThing Wrong here'),
          );
        });
    }
  }
}
