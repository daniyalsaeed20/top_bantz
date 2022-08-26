import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../bottom_navigation/chatroom.dart';
import '../models/ChatRoomModel.dart';
import '../models/UserModel.dart';
import '../splash_screen/group_chats/group_chat_screen.dart';

class ChatsMainScreen extends StatefulWidget {
  ChatsMainScreen({Key? key, required this.userModel}) : super(key: key);

  UserModel userModel;

  @override
  State<ChatsMainScreen> createState() =>
      _ChatsMainScreenState(userModel: userModel);
}

class _ChatsMainScreenState extends State<ChatsMainScreen> {
  _ChatsMainScreenState({required this.userModel});
  UserModel userModel;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    final s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor("#FFFFFF"),
        title: Text(
          "Chats",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Lato",
            fontWeight: FontWeight.w600,
            color: HexColor("#262626"),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor("#262626"),
            )),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: s.height,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("chatrooms")
                    .where("participants.${user!.uid}", isEqualTo: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      QuerySnapshot chatRoomSnapshot =
                          snapshot.data as QuerySnapshot;
                      if (chatRoomSnapshot.size > 0) {
                        return ListView.builder(
                          itemCount: chatRoomSnapshot.docs.length,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, index) {
                            ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
                                chatRoomSnapshot.docs[index].data()
                                    as Map<String, dynamic>);

                            Map<String, dynamic> participants =
                                chatRoomModel.participants!;

                            List<String> participantKeys =
                                participants.keys.toList();
                            participantKeys.remove(user.uid);
                            print('user' + participantKeys.toString());
                            return FutureBuilder(
                              future: FirebaseHelper.getUserModelById(
                                  participantKeys[0]),
                              builder: (context, userData) {
                                if (userData.connectionState ==
                                    ConnectionState.done) {
                                  if (userData.data != null) {
                                    UserModel targetUser =
                                        userData.data as UserModel;

                                    return Material(
                                      elevation: 10,
                                      child: Card(
                                        elevation: 8,
                                        shadowColor: Colors.black,
                                        color: Colors.white,
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                // return ChatRoomPage(
                                                //   chatroom: chatRoomModel,
                                                //   firebaseUser: widget.firebaseUser,
                                                //   userModel: widget.userModel,
                                                //   targetUser: targetUser,
                                                // );
                                                return ChattingScreen(
                                                  chatroom: chatRoomModel,
                                                  targetUser: targetUser,
                                                );
                                              }),
                                            );
                                          },
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                targetUser.profilepic
                                                    .toString()),
                                          ),
                                          title: Text(
                                              targetUser.fullname.toString()),
                                          subtitle: (chatRoomModel.lastMessage
                                                      .toString() !=
                                                  "")
                                              ? Text(chatRoomModel.lastMessage
                                                  .toString())
                                              : Text(
                                                  "Say hi to your new friend!",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                        child: Text('No Chats Avalaible'));
                                  }
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('No Chats Avalaible'));
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return Center(
                        child: Text("No Chats"),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupChatHomeScreen(
              userModel:userModel,
            ),
          ),
        ),
      ),
    );
  }
}
