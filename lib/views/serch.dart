import 'package:chat_app/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController serchEditingController = new TextEditingController();

  late QuerySnapshot searchSnapshot;
  initiateSearch() {
    databaseMethods.getUserByUsername(serchEditingController.text).then((val) {
      searchSnapshot = val;
    });
  }

  Widget searchList() {
    return ListView.builder(
        itemCount: searchSnapshot.docs.length,
        itemBuilder: (context, index) {
          return SerchTile(
            userName: searchSnapshot.docs[index].data["userName"],
           userEmail: "");
        });
  }

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
                  controller: serchEditingController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search user name",
                      hintStyle: TextStyle(color: Colors.white54)),
                )),
                GestureDetector(
                  onTap: (() {
                    initiateSearch();
                  }),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0x36FFFFFF),
                            const Color(0X0FFFFFFF)
                          ]),
                          borderRadius: BorderRadius.circular(40)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset('assets/images/serch.png')),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class SerchTile extends StatelessWidget {
  // const SerchTile({super.key});
  final String userName;
  final String userEmail;
  SerchTile({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                userName,
                style: simpleTextStyle(),
              ),
              Text(
                userEmail,
                style: simpleTextStyle(),
              )
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message"),
          )
        ],
      ),
    );
  }
}
