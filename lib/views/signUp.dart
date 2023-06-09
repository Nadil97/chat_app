import 'package:chat_app/service/auth.dart';
import 'package:chat_app/service/database.dart';
import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

import 'chatRoom.dart';

class SignUp extends StatefulWidget {
  // const SignUp({super.key});
  final Function toggle;
  SignUp(this.toggle);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethod authMethods = new AuthMethod();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  signMeUp() {
    if (formKey.currentState!.validate()) {
      Map<String, String> userInfoMap = {
        "name": _userNameController.text,
        "email": _emailController.text
      };
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((val) {
        // print("${val.uId}");

        databaseMethods.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 40,
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  validator: (val) {
                                    return val!.isEmpty || val.length < 2
                                        ? "please provide user name"
                                        : null;
                                  },
                                  controller: _userNameController,
                                  style: simpleTextStyle(),
                                  decoration:
                                      textFieldInputDecoration("User name")),
                              TextFormField(
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val!)
                                        ? null
                                        : "Enter correct email";
                                  },
                                  controller: _emailController,
                                  style: simpleTextStyle(),
                                  decoration:
                                      textFieldInputDecoration("email")),
                              TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    return val!.length > 4
                                        ? null
                                        : "please provide password 6+ character";
                                  },
                                  controller: _passwordController,
                                  style: simpleTextStyle(),
                                  decoration:
                                      textFieldInputDecoration("password")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'Forget Password !',
                              style: simpleTextStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: (() {
                            signMeUp();
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xff00008B),
                                  const Color(0xff2A75BC)
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Sign up",
                              style: simpleTextStyle(),
                            ),
                          ),
                        ),
                        // signIn with Google button
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Sign up with Google",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 17),
                          ),
                        ),
                        //
                        SizedBox(
                          height: 10,
                        ),
                        // cretae register now option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Alredy have account ? ',
                              style: mediamTextStyle(),
                            ),
                            GestureDetector(
                              onTap: (() {
                                widget.toggle();
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'SignIn Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        )
                      ],
                    )),
              ),
            ),
    );
  }
}
