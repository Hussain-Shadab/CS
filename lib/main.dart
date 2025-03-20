import 'package:coffee_shop/provider/bottom_navigation_provider.dart';
import 'package:coffee_shop/provider/drop_down_button_provider.dart';
import 'package:coffee_shop/provider/increment-provider.dart';
import 'package:coffee_shop/provider/tab_buttons_provider.dart';
import 'package:coffee_shop/utils/routes/routes.dart';
import 'package:coffee_shop/utils/routes/routes_name.dart';
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
      ChangeNotifierProvider(create: (_)=> DropDownButtonProvider()),
      ChangeNotifierProvider(create: (_)=> TabButtonsProvider()),
      ChangeNotifierProvider(create: (_) =>CoffeeProvider()),
    ],
    child:  ScreenUtilInit(
      designSize: Size(360, 690),

      builder : (context ,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.itemDetailScreen,
        onGenerateRoute: Routes.generateRoute,

      ),
    ),
    );
  }
}

