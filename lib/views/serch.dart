import 'package:chat_app/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import '../widget/widget.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   DatabaseMethods databaseMethods = new DatabaseMethods();
//   TextEditingController serchEditingController = new TextEditingController();

//   late QuerySnapshot searchSnapshot;
//   initiateSearch() {
//     databaseMethods.getUserByUsername(serchEditingController.text).then((val) {
//       setState(() {
//         searchSnapshot = val;
//       });
//     });
//   }

//   Widget searchList() {
//     return searchSnapshot != null
//         ? ListView.builder(
//             itemCount: searchSnapshot.docs.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return SerchTile(
//                   userName: searchSnapshot.docs[index]["name"],
//                   userEmail: searchSnapshot.docs[index]["email"]);
//             })
//         : Container(
//             child: Text("hello"),
//           );
//   }

//   @override
//   void initState() {
//     // initiateSearch();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarMain(),
//       body: Container(
//           child: Column(
//         children: [
//           Container(
//             color: Color(0x54FFFFFF),
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: TextField(
//                   controller: serchEditingController,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                       hintText: "Search user name",
//                       hintStyle: TextStyle(color: Colors.white54)),
//                 )),
//                 GestureDetector(
//                   onTap: () {
//                     initiateSearch();
//                   },
//                   child: Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(colors: [
//                             const Color(0x36FFFFFF),
//                             const Color(0X0FFFFFFF)
//                           ]),
//                           borderRadius: BorderRadius.circular(40)),
//                       padding: EdgeInsets.all(8),
//                       child: Image.asset('assets/images/serch.png')),
//                 )
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

// class SerchTile extends StatelessWidget {
//   // const SerchTile({super.key});
//   final String userName;
//   final String userEmail;
//   const SerchTile({required this.userName, required this.userEmail});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Text(
//                 userName,
//                 style: simpleTextStyle(),
//               ),
//               Text(
//                 userEmail,
//                 style: simpleTextStyle(),
//               )
//             ],
//           ),
//           Spacer(),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.blue, borderRadius: BorderRadius.circular(30)),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text("Message"),
//           )
//         ],
//       ),
//     );
//   }
// }


// import 'package:chat_app/service/database.dart';
// import 'package:chatapp/helper/constants.dart';
// import 'package:chatapp/models/user.dart';
// import 'package:chatapp/services/database.dart';
// import 'package:chatapp/views/chat.dart';
// import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchEditingController = new TextEditingController();
  late QuerySnapshot searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if(searchEditingController.text.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      await databaseMethods.searchByName(searchEditingController.text)
          .then((snapshot){
        searchResultSnapshot = snapshot;
        print("$searchResultSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList(){
    return haveUserSearched ? ListView.builder(
      shrinkWrap: true,
      itemCount: searchResultSnapshot.docs.length,
        itemBuilder: (context, index){
        return userTile(
          searchResultSnapshot.docs[index]["userName"],
          searchResultSnapshot.docs[index]["userEmail"],
        );
        }) : Container();
  }

  /// 1.create a chatroom, send user to the chatroom, other userdetails
  sendMessage(String userName){
    // List<String> users = [Constants.myName,userName];

    // String chatRoomId = getChatRoomId(Constants.myName,userName);

    // Map<String, dynamic> chatRoom = {
    //   "users": users,
    //   "chatRoomId" : chatRoomId,
    // };

    // databaseMethods.addChatRoom(chatRoom, chatRoomId);

    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) => Chat(
    //     chatRoomId: chatRoomId,
    //   )
    // ));

  }

  Widget userTile(String userName,String userEmail){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }


  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) :  Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Color(0x54FFFFFF),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchEditingController,
                      style: simpleTextStyle(),
                      decoration: InputDecoration(
                        hintText: "search username ...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset("assets/images/serch.png",
                          height: 25, width: 25,)),
                  )
                ],
              ),
            ),
            userList()
          ],
        ),
      ),
    );
  }
}