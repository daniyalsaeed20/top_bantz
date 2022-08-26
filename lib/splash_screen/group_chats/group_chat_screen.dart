import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/view/group_chat_screen.dart';

import 'create_group/add_members.dart';
import 'group_chat_room.dart';

class GroupChatHomeScreen extends StatefulWidget {
  GroupChatHomeScreen({Key? key, required this.userModel}) : super(key: key);
  UserModel userModel;
  @override
  _GroupChatHomeScreenState createState() =>
      _GroupChatHomeScreenState(userModel: userModel);
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  _GroupChatHomeScreenState({required this.userModel});
  UserModel userModel;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  List groupList = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('Users')
        .doc(uid)
        .collection('groups')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: isLoading
          ? Container(
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(
                    // MaterialPageRoute(
                    //   builder: (_) => GroupChatRoom(
                    //     groupName: groupList[index]['name'],
                    //     groupChatId: groupList[index]['id'],
                    //   ),
                    // ),
                    MaterialPageRoute(
                      builder: (_) => GroupChatScreen(
                        groupName: groupList[index]['name'],
                        groupChatId: groupList[index]['id'],
                        userModel:userModel,
                      ),
                    ),
                  ),
                  leading: Icon(Icons.group),
                  title: Text(groupList[index]['name']),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AddMembersInGroup(),
          ),
        ),
        tooltip: "Create Group",
      ),
    );
  }
}
