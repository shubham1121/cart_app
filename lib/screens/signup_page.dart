import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/src/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();

  Future<void> validateSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print(_userEmailController.text);
      print(_userPasswordController.text);
      await context.read<AuthService>().signUpUser(email:_userEmailController.text, password: _userPasswordController.text);
    }
  }

  @override
  void dispose() {
    _userEmailController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome !",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Sign Up To Continue",
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userEmailController,
                          decoration: InputDecoration(
                              hintText: "Enter Email", labelText: "Email"),
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a Valid Email'
                                  : null,
                        ),
                        TextFormField(
                          controller: _userPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Password can\'t be Empty';
                            } else if (password.length < 6) {
                              return 'Password should be atleast of length 6';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).buttonColor,
                          child: InkWell(
                            onTap: () => validateSignUp(context),
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 300,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Register',
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
                ),
              ],
            ),
          ),
        ));
  }
}
