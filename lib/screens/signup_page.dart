import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Text(
            'SignUp Page',
            style: TextStyle(
              fontSize: 40,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
