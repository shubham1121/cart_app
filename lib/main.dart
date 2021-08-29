import 'package:first_app/models/cart.dart';
import 'package:first_app/screens/cart_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'widgets/themes.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
      create: (context)=>CartModel(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          MyRoutes.homeRoute:(context)=>HomePage(),
          MyRoutes.loginRoute:(context)=>LoginPage(),
          MyRoutes.signupRoute:(context)=>SignupPage(),
          MyRoutes.cartRoute:(context)=>CartPage(),
        },
      ),
    );
  }
}
