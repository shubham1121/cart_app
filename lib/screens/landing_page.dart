import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/utils/routes.dart';
class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 30 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Icon(Icons.shopping_bag_rounded,
                  size:300,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts:[TypewriterAnimatedText('Catalog App')],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            borderRadius:
                            BorderRadius.circular(8),
                            color: Theme.of(context).buttonColor,
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(context, MyRoutes.loginRoute),
                              child: AnimatedContainer(
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                height: 40,
                                width: 120,
                              ),
                            ),
                          ),
                          Material(
                            borderRadius:
                            BorderRadius.circular(8),
                            color: Theme.of(context).buttonColor,
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(context, MyRoutes.signupRoute),
                              child: AnimatedContainer(
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                height: 40,
                                width: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
