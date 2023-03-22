/*
 * Copyright (c) 2021. by MechSIT (Pvt) Ltd
 *
 * All rights reserved.
 *
 * This software is the confidential and proprietary information
 * of MechSIT (Pvt) Ltd. ("Confidential Information"). You
 * shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement
 * you entered into with MechSIT (Pvt) Ltd.
 *
 *
 * @Author Nadil Sandaruwan
 * @Date 22/03/2023
 */

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
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
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
                    "Sign In",
                    style: simpleTextStyle(),
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
                    "Sign In with Google",
                    style: TextStyle(color: Colors.black87, fontSize: 17),
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
                      'Dont have account ? ',
                      style: mediamTextStyle(),
                    ),
                    Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                )
              ],
            )),
      ),
    );
  }
}
