import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/models/sharedPrefrences.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:uuid/uuid.dart';

class MessageController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  TextEditingController sendMessageController = TextEditingController();
  bool isRecorderActive = false;
  UserModel userModel = UserModel();
  String videoUrl = 'null';

  /* -------------------------------------------------------------------------- */
  /*                                    Lists                                   */
  /* -------------------------------------------------------------------------- */

  // List<MessageModel> messages = [];

  List<ChatMessageModel> messages = [
    ChatMessageModel(
      send_by: '2',
      message: "Hello",
      type: "txt",
    ),
    ChatMessageModel(
      send_by: '1',
      message:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      type: "vid",
    ),
    ChatMessageModel(
      send_by: '1',
      message:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      type: "vid",
    ),
    ChatMessageModel(
      send_by: '1',
      message: "How are you?",
      type: "txt",
    ),
    ChatMessageModel(
      send_by: '2',
      message: "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
      type: "img",
    ),
    ChatMessageModel(
      send_by: '1',
      message:
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      send_by: '2',
      message:
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      send_by: '1',
      message:
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      send_by: '2',
      message: "Never better.",
      type: "txt",
    ),
    ChatMessageModel(
      send_by: '2',
      message: "How is life treating you these days?",
      type: "txt",
    ),
  ];

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

  chatTemp() {
    messages.add(
      ChatMessageModel(
          message: sendMessageController.text, type: "txt", send_by: '2'),
    );
    messages.add(
      ChatMessageModel(message: "What do you mean?", type: "txt", send_by: '1'),
    );
    update();
    sendMessageController.text = "";
  }

  getUserData() async {
    var snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    userModel = UserModel.fromMap(snap.data()!);
    update();
  }

  void onSendMessage({required String id}) async {
    var userDataModel = await MySharedPrefrences.getUserData();
    try {
      if (sendMessageController.text.isNotEmpty) {
        Map<String, dynamic> chatData = {
          "sendBy": userDataModel.fullname,
          "message": sendMessageController.text,
          "type": "text",
          "time": FieldValue.serverTimestamp(),
        };

        sendMessageController.clear();

        await FirebaseFirestore.instance
            .collection('groups')
            .doc(id)
            .collection('chats')
            .add(chatData);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future uploadVideoForGroup(videoFile, groupChatId) async {
    String fileName = Uuid().v1();
    User? user = FirebaseAuth.instance.currentUser;
    

    String video = "vid";
    int status = 1;

    var userDataModel = await MySharedPrefrences.getUserData();

    Map<String, dynamic> chatData = {
      "sendBy": userDataModel.fullname,
      "message": 'null',
      "type": "vid",
      "time": FieldValue.serverTimestamp(),
    };

    var docId;
    await FirebaseFirestore.instance
        .collection('groups')
        .doc(groupChatId)
        .collection('chats')
        .add(chatData)
        .then((value) => docId = value.id);

    var ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child("${DateTime.now()}");

    var uploadTask = await ref.putFile(videoFile).catchError((error) async {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .delete();

      status = 0;
    });
    if (status == 1) {
      String videoUrl = await uploadTask.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .update({
        "type": video,
        "message": videoUrl,
      });

      print(videoUrl);
    }
  }

  Future uploadImage(videoFile, groupChatId) async {
    String fileName = Uuid().v1();
    User? user = FirebaseAuth.instance.currentUser;

    String img = "img";
    int status = 1;

    var userDataModel = await MySharedPrefrences.getUserData();

    Map<String, dynamic> chatData = {
      "sendBy": userDataModel.fullname,
      "message": 'null',
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    };

    var docId;
    await FirebaseFirestore.instance
        .collection('groups')
        .doc(groupChatId)
        .collection('chats')
        .add(chatData)
        .then((value) => docId = value.id);

    var ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child("${DateTime.now()}");

    var uploadTask = await ref.putFile(videoFile).catchError((error) async {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .delete();

      status = 0;
    });
    if (status == 1) {
      String imgUrl = await uploadTask.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .update({
        "type": img,
        "message": imgUrl,
      });

      print(imgUrl);
    }
  }
}
