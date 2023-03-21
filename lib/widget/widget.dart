import 'package:flutter/material.dart';

class appBarMain extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff00008B),
        // borderRadius: BorderRadius.only(bottomLeft: )
        image: DecorationImage(
            alignment: Alignment.bottomLeft,
            image: AssetImage('assets/images/logo.png')),
      ),
    );
  }
}
