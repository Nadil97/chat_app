import 'package:flutter/material.dart';

import '../widget/widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController serchEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(),
      body: Container(
          child: Column(
        children: [
          Container(
            color: Color(0x54FFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search user name",
                      hintStyle: TextStyle(color: Colors.white54)),
                )),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0x36FFFFFF),
                          const Color(0X0FFFFFFF)
                        ]),
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset('assets/images/serch.png'))
              ],
            ),
          )
        ],
      )),
    );
  }
}
