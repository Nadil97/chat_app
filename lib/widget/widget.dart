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

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white60)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)));
}

TextStyle mediamTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
