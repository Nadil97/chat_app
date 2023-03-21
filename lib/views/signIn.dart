import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("email")),
              TextField(
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("password")),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Forget Password',
                    style: simpleTextStyle(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
