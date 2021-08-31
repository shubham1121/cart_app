import 'package:first_app/models/cart.dart';
import 'package:first_app/screens/cart_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Material(
              child: Center(
                  child: Text('Sorry For The Error ${snapshot.error}'),
                ),

            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream:FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.active)
                  {
                    Object? user=snapshot.data;
                    if(user==null)
                      {
                        return MyApp();
                      }
                    else {
                      return MaterialApp(
                        home: HomePage(),
                      );
                      // return MyApp();
                    }
                  }
                return Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            );
          }
          return MyApp();
        });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
      create: (context) => CartModel(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.landingRoute,
        routes: {
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.signupRoute: (context) => SignupPage(),
          MyRoutes.cartRoute: (context) => CartPage(),
          MyRoutes.landingRoute: (context)=>LandingPage(),
        },
      ),
    );
  }
}
