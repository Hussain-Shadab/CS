import 'package:coffee_shop/provider/bottom_navigation_provider.dart';
import 'package:coffee_shop/provider/increment-provider.dart';
import 'package:coffee_shop/utils/routes/routes.dart';
import 'package:coffee_shop/utils/routes/routes_name.dart';
import 'package:coffee_shop/view/splash_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>CoffeProvider()),
      ChangeNotifierProvider(create: (_)=>BottomNavigationProvider()),
    ],
    child:  ScreenUtilInit(
      designSize: Size(360, 690),

      builder : (context ,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: Routes.generateRoute,

      ),
    ),
    );
  }
}

