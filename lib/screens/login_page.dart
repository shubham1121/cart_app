import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/firebase_auth.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  // try{
  //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: , password: )
  // }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(milliseconds: 290));
      setState((){
         context.read<AuthService>().loginUser(
            email: _userEmailController.text,
            password: _userPasswordController.text);
      });
      setState(() {
        changedButton = false;
      });
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
                      "Login To Continue",
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userEmailController,
                          decoration: InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "UserName",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username Can't Be Empty";
                            } else
                              return null;
                          },
                        ),
                        TextFormField(
                          controller: _userPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password Can't Be Empty";
                            } else if (value.length < 6) {
                              return "Password should be atleast of length 6";
                            } else
                              return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Material(
                          borderRadius:
                              BorderRadius.circular(changedButton ? 40 : 8),
                          color: Theme.of(context).buttonColor,
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 300,
                              ),
                              alignment: Alignment.center,
                              child: changedButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                              height: 40,
                              width: changedButton ? 40 : 120,
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
