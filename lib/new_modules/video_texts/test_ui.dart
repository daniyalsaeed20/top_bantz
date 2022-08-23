import 'dart:developer';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_bantz/bottom_navigation/chatroom.dart';
import 'package:top_bantz/main.dart';
import 'package:top_bantz/models/ChatRoomModel.dart';
import 'package:top_bantz/models/MessageModel.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/audio_texts/audio_bloc/audio_bloc.dart';
import 'package:top_bantz/new_modules/audio_texts/test_ui.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

File? videoFile;

class TestUi extends StatelessWidget {
  const TestUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // VideoButton(
            //   chatroomId: '123123123',
            // ),
            VideoBox(url: ""),
            BlocProvider(
              create: (context) => AudioBloc()..add(IsNotPlayingEvent()),
              child: PlayButton(
                  url:
                      'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav'),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoButton extends StatefulWidget {
  VideoButton(
      {Key? key,
      required this.chatroom,
      this.groupchatId = '',
      this.isGroup = false})
      : super(key: key);
  final ChatRoomModel? chatroom;
  final String groupchatId;
  final bool isGroup;
  @override
  State<VideoButton> createState() => _VideoButtonState(
      chatroom: chatroom, groupchatId: groupchatId, isGroup: isGroup);
}

class _VideoButtonState extends State<VideoButton> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ChatRoomModel? chatroom;

  final String groupchatId;
  final bool isGroup;

  _VideoButtonState(
      {required this.chatroom,
      required this.groupchatId,
      required this.isGroup});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPhotoOptions();
      },
      child: Icon(
        Icons.videocam,
        color: Color(
          0xff65656b,
        ),
      ),
    );
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            title: Center(child: Text("Upload  Video")),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    getVideo(ImageSource.gallery, isGroup, groupchatId);
                  },
                  leading: Icon(Icons.image),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    getVideo(ImageSource.camera, isGroup, groupchatId);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Capture Video"),
                ),
              ],
            ),
          );
        });
  }

  Future getVideo(ImageSource source, isGroup, groupChatId) async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickVideo(source: source).then((xFile) {
      if (xFile != null) {
        videoFile = File(
          xFile.path,
        );
        setState(() {});

        if (!isGroup) {
          uploadVideo(videoFile);
        } else {
          uploadVideoForGroup(videoFile, groupChatId);
        }
      }
    });
  }

  Future uploadVideo(imageFile) async {
    String fileName = Uuid().v1();
    User? user = _auth.currentUser;

    String img = "vid";
    int status = 1;
    MessageModel newMessage = MessageModel(
      messageid: uuid.v1(),
      sender: user!.uid,
      createdon: DateTime.now(),
      text: img,
      img: img,
      type: img,
      seen: false,
    );
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatroom!.chatroomid)
        .collection("messages")
        .doc(newMessage.messageid)
        .set(newMessage.toMap());

    var ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child("${DateTime.now()}");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await _firestore
          .collection('chatrooms')
          .doc(chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatrooms')
          .doc(chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .update({
        "text": img,
        "img": imageUrl,
      });

      widget.chatroom!.lastMessage = img;
      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatroom!.chatroomid)
          .set(widget.chatroom!.toMap());

      print(imageUrl);
      setState(() {});
    }

    print(uploadTask);
  }

  Future uploadVideoForGroup(videoFile, groupChatId) async {
    String fileName = Uuid().v1();
    User? user = _auth.currentUser;

    String video = "vid";
    int status = 1;

    UserModel? usermodel = await FirebaseHelper.getUserModelById(
        _auth.currentUser!.uid.toString());

    Map<String, dynamic> chatData = {
      "sendBy": usermodel!.fullname,
      "message": 'null',
      "type": "vid",
      "time": FieldValue.serverTimestamp(),
    };

    var docId;
    await _firestore
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
      await _firestore
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .delete();

      status = 0;
    });
    if (status == 1) {
      String videoUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
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
}

class VideoBox extends StatefulWidget {
  VideoBox({Key? key, required this.url}) : super(key: key);
  String url;
  @override
  State<VideoBox> createState() => _VideoBoxState(url: url);
}

class _VideoBoxState extends State<VideoBox> {
  var controller;

  _VideoBoxState({required this.url});

  String url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.network('url')
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.height / 2.5,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 1,
                offset: Offset(1, 2)),
          ]),
      child: Chewie(
        controller: ChewieController(
          allowFullScreen: false,
          showControls: true,
          videoPlayerController: VideoPlayerController.network(url),
          // videoPlayerController: VideoPlayerController.network(
          //     'https://firebasestorage.googleapis.com/v0/b/top-bantz-db7af.appspot.com/o/images%2F2022-08-13%2015%3A53%3A56.995488?alt=media&token=ce2c9b49-1de9-44e1-a173-120b849993c3'),
          aspectRatio: 1.3 / 2,
          autoPlay: false,
          looping: false,
        ),
      ),
    );
  }
}
