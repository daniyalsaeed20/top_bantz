import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:top_bantz/new_modules/audio_texts/audio_bloc/audio_bloc.dart';
import 'package:top_bantz/new_modules/audio_texts/test_ui.dart';
import 'package:top_bantz/new_modules/video_texts/test_ui.dart';

import 'package:uuid/uuid.dart';

import '../main.dart';
import '../models/ChatRoomModel.dart';
import '../models/MessageModel.dart';
import '../models/UserModel.dart';
import '../models/message_enum.dart';

class ChattingScreen extends StatefulWidget {
  // final LostItemModel lostItemModel;
  final UserModel? targetUser;
  final ChatRoomModel? chatroom;
  const ChattingScreen(
      {Key? key,
      // required this.lostItemModel,
      this.targetUser,
      required this.chatroom})
      : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  bool isShowSendButton = false;
  bool isRecorderInit = false;
  bool isRecording = false;
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // openAudio();
  }

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? imageFile;

//   void openAudio()async{
// final status = await Permission.microphone.request();
// if(status!= PermissionStatus.granted){
//   throw RecordingPermissionException('Mic Permission not allowed!');
// }
// await _soundRecorder!.openRecorder();
// isRecorderInit =true;
//
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     messageController.dispose();
//     _soundRecorder!.closeRecorder();
//     isRecorderInit =false;
//   }

  Future getImage(ImageSource value) async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: value).then((xFile) {
      if (xFile != null) {
        imageFile = File(
          xFile.path,
        );

        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    User? user = _auth.currentUser;

    String img = "img";
    int status = 1;
    MessageModel newMessage = MessageModel(
        messageid: uuid.v1(),
        sender: user!.uid,
        createdon: DateTime.now(),
        text: img,
        img: img,
        type: img,
        seen: false);

    // await _firestore
    //     .collection('chatroom')
    //     .doc(chatRoomId)
    //     .collection('chats')
    //     .doc(fileName)
    //     .set({
    //   "sendby": _auth.currentUser!.displayName,
    //   "message": "",
    //   "type": "img",
    //   "time": FieldValue.serverTimestamp(),
    // });
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(widget.chatroom!.chatroomid)
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
          .doc(widget.chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatrooms')
          .doc(widget.chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .update({
        "text": img,
        "img": imageUrl,
      });

      widget.chatroom!.lastMessage = img;
      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom!.chatroomid)
          .set(widget.chatroom!.toMap());

      print(imageUrl);
    }
  }

  // Future<String?> uploadAudioToStorage(File audioFile) async {
  //   try {
  //
  //     Reference  ref = FirebaseStorage.instance.ref().child('chatAudios/${DateTime.now().millisecondsSinceEpoch}');
  //     UploadTask uploadTask = ref.putFile(audioFile,SettableMetadata(contentType: 'audio/wav'));
  //     //  Uri downloadUrl = (await uploadTask.onComplete).uploadSessionUri;
  //     var downloadUrl = (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
  //     final String url = await downloadUrl;
  //
  //
  //     print("url:$url");
  //     return  url;
  //
  //   } catch (error) {
  //     print("error$error");
  //     return null;
  //   }
  //
  // }
  void sendMessage() async {
    User? user = _auth.currentUser;

    String msg = messageController.text.trim();
    //  messageController.clear();

    if (msg != "") {
      // Send Message
      MessageModel newMessage = MessageModel(
          messageid: uuid.v1(),
          sender: user!.uid,
          createdon: DateTime.now(),
          text: msg,
          type: "text",
          seen: false);

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom!.chatroomid)
          .collection("messages")
          .doc(newMessage.messageid)
          .set(newMessage.toMap());

      widget.chatroom!.lastMessage = msg;
      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom!.chatroomid)
          .set(widget.chatroom!.toMap());

      log("Message Sent!");
    }
    // else{
    //   var tempDir = await getTemporaryDirectory();
    //   var path ='${tempDir.path}/flutter _sound.aac';
    //   if(!isRecorderInit){
    //     return;
    //   }
    //   if(isRecording){
    //     var userDataMap =
    //
    //     await _soundRecorder!.stopRecorder();
    //    // sendFileMessage(File(path), MessageEnum.audio);
    //   }
    //   else{
    //     await _soundRecorder!.startRecorder(
    //       toFile: path,
    //     );
    //   }
    //   setState(() {
    //     isRecording = !isRecording;
    //   });
    // }
  }

  // void sendFileMessage(
  //     File file,
  //     MessageEnum messageEnum,
  //     ) {
  //   ref.read(chatControllerProvider).sendFileMessage(
  //     context,
  //     file,
  //     widget.recieverUserId,
  //     messageEnum,
  //     widget.isGroupChat,
  //   );
  // }

  Widget build(BuildContext context) {
    // Map<String, dynamic> users=  FirebaseFirestore.instance.collection("Users").doc(widget.lostItemModel.id).get() ;
    // Map<String, dynamic> userdata=users as   Map<String, dynamic>;
    // UserModel userModel=UserModel.fromMap(userdata);
    User? user = _auth.currentUser;
    final size = MediaQuery.of(context).size;
    void showPhotoOptions() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Center(child: Text("Upload  Picture")),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    leading: Icon(Icons.image),
                    title: Text("Select from Gallery"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    leading: Icon(Icons.camera_alt),
                    title: Text("Take a photo"),
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: HexColor("#FFFFFF"),
      //   title:
      //   StreamBuilder<DocumentSnapshot>(
      //     stream:
      //     _firestore.collection("Users").doc(widget.targetUser!.uid).snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.data != null) {
      //         return Container(
      //           child: Column(
      //             children: [
      //               Text(widget.targetUser!.fullname.toString(),
      //                 style: TextStyle(
      //                   fontSize: 22,
      //                   fontFamily: "Lato",
      //                   fontWeight: FontWeight.w600,
      //                   color: HexColor("#262626"),
      //                 ),
      //               ),
      //               Text(
      //                 snapshot.data!['status'],
      //                 style: TextStyle(fontSize: 14,
      //                   color: HexColor("#262626"),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //       } else {
      //         return Container();
      //       }
      //     },
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(
      //         Icons.arrow_back_ios,
      //         color: HexColor("#262626"),
      //       )),
      //   toolbarHeight: 70,
      // ),

      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * .14,
              width: size.width,
              child: Stack(children: [
                Container(
                  height: size.height * .12,
                  width: size.width,
                  color: Color(0xff212020),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Container(
                              width: size.width * .06,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Container(
                              height: size.height * .08,
                              width: size.width * .12,
                              child: Image.asset(
                                'assets/images/splash_image.png',
                              )),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                              width: size.width * .3,
                              child: Text(
                                'Lobby',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),

                          SizedBox(
                            width: size.width * .25,
                          ),
                          // Stack(
                          //   alignment: Alignment.center,
                          //   children: [
                          //     Container(
                          //       height: size.height*.05,
                          //       width: size.width*.1,
                          //       decoration: BoxDecoration(
                          //           color: Color(0xff7a7979),
                          //           borderRadius: BorderRadius.circular(15)
                          //       ),
                          //     ),
                          //     Container(
                          //         height: size.height*.07,
                          //         width: size.width*.07,
                          //         child: Image.asset('assets/images/leagues/barcelona.png')),
                          //   ],
                          // ),
                          // Container(
                          //     height: size.height*.1,
                          //     width: size.width*.1,
                          //     alignment: Alignment.center,
                          //     child: Text('VS',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: size.height * .05,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                    color: Color(0xff7a7979),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Container(
                                  height: size.height * .07,
                                  width: size.width * .07,
                                  child: Image.asset(
                                      'assets/images/leagues/barcelona.png')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: size.height * .045,
                    width: size.width * .24,
                    decoration: BoxDecoration(
                        color: Color(0xffdba111),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 9,
                        ),
                        Container(
                          height: size.height * .039,
                          width: size.width * .09,
                          decoration: BoxDecoration(
                              color: Color(0xffffd246),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: size.height * .03,
                                  width: size.width * .09,
                                  child: Text('AD')),
                              Container(
                                alignment: Alignment.center,
                                height: size.height * .008,
                                width: size.width * .09,
                                color: Color(0xffccf5ff),
                                child: Text(
                                  '‐',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          height: size.height * .039,
                          width: size.width * .09,
                          child: Text(
                            'View Ads',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chatrooms")
                      .doc(widget.chatroom!.chatroomid)
                      .collection("messages")
                      .orderBy("createdon", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot dataSnapshot =
                            snapshot.data as QuerySnapshot;

                        return ListView.builder(
                          physics: MediaQuery.of(context).size.height > 450.0 &&
                                  MediaQuery.of(context).size.height <= 604.0
                              ? ScrollPhysics()
                              : NeverScrollableScrollPhysics(),
                          reverse: true,
                          itemCount: dataSnapshot.docs.length,
                          itemBuilder: (context, index) {
                            MessageModel currentMessage = MessageModel.fromMap(
                                dataSnapshot.docs[index].data()
                                    as Map<String, dynamic>);

                            return currentMessage.type == "text"
                                ? Row(
                                    mainAxisAlignment:
                                        (currentMessage.sender == user!.uid)
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: (currentMessage.sender ==
                                                  user.uid)
                                              ? EdgeInsets.only(
                                                  left: 20,
                                                  right: 10,
                                                  bottom: 10)
                                              : EdgeInsets.only(
                                                  right: 20,
                                                  left: 10,
                                                  bottom: 10),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: (currentMessage.sender ==
                                                    user.uid)
                                                ? HexColor("#2A2249")
                                                : HexColor("#EDEDED"),
                                            borderRadius: (currentMessage
                                                        .sender ==
                                                    user.uid)
                                                ? const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft:
                                                        Radius.circular(15))
                                                : const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15)),
                                          ),
                                          child: Text(
                                            currentMessage.text.toString(),
                                            style: TextStyle(
                                                color: (currentMessage.sender ==
                                                        user.uid)
                                                    ? Colors.white
                                                    : Colors.black),
                                            //  maxLines: null,
                                            //softWrap: true,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : currentMessage.type == 'vid'
                                    ? currentMessage.img.toString() == 'vid'
                                        ? Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.5,
                                            width: 150,
                                            color: Colors.white,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0,
                                                left: 10,
                                                right: 10),
                                            child: VideoBox(
                                              url:
                                                  currentMessage.img.toString(),
                                            ),
                                          )
                                    : currentMessage.type == 'audio'
                                        ? BlocProvider(
                                            create: (context) => AudioBloc()
                                              ..add(IsNotPlayingEvent()),
                                            child: PlayButton(
                                                url: currentMessage.img!),
                                          )
                                        : Container(
                                            height: size.height / 2.5,
                                            width: size.width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            alignment: currentMessage.sender ==
                                                    user!.uid
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) => ShowImage(
                                                      imageUrl: currentMessage
                                                          .img
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                  height: size.height / 2.5,
                                                  width: size.width / 2,
                                                  decoration: BoxDecoration(
                                                      border: Border.all()),
                                                  alignment:
                                                      currentMessage.img != null
                                                          ? null
                                                          : Alignment.center,
                                                  child: CachedNetworkImage(
                                                    imageUrl: currentMessage.img
                                                                .toString() !=
                                                            ""
                                                        ? currentMessage.img
                                                            .toString()
                                                        : "Loading",
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                new CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        currentMessage.img
                                                                    .toString() !=
                                                                ""
                                                            ? new Icon(
                                                                Icons.refresh)
                                                            : new Icon(
                                                                Icons.error),
                                                  )),
                                            ),
                                          );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              "An error occured! Please check your internet connection."),
                        );
                      } else {
                        return Center(
                          child: Text("Say hi to your new friend"),
                        );
                      }
                    } else {
                      return Center(
                        child: Container(),
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: size.width * .95,
                height: size.height * .1,
                // padding: EdgeInsets.all(30),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * .75,
                      height: size.height * .06,
                      decoration: BoxDecoration(
                          color: Color(0xff212020),
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        onChanged: (val) {
                          // if(val.isNotEmpty){
                          //   setState(() {
                          //     isShowSendButton  = true;
                          //   });
                          // }
                          // else{
                          //   setState(() {
                          //     isShowSendButton  = false;
                          //   });
                          // }
                        },
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff65656b),
                        ),
                        controller: messageController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 12, left: 12),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BlocProvider(
                                  create: (context) =>
                                      AudioBloc()..add(IsNotRecordingEvent()),
                                  child:
                                      RecordButton(chatroom: widget.chatroom!),
                                ),
                                VideoButton(chatroom: widget.chatroom!),
                                GestureDetector(
                                  onTap: () {
                                    showPhotoOptions();
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color(0xff65656b),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            border: InputBorder.none,
                            hintText: 'Type Here...',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xff65656b),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: sendMessage,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                            backgroundColor: Color(0xff212020),
                            radius: 25,
                            child: Icon(Icons.send)
                            // Icon(isShowSendButton ? Icons.send  :isRecording?
                            // Icons.close: Icons.mic,color:Colors.white)
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FirebaseHelper {
  static Future<UserModel?> getUserModelById(String uid) async {
    UserModel? userModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();

    if (docSnap.data() != null) {
      userModel = UserModel.fromMap(docSnap.data() as Map<String, dynamic>);
    }

    return userModel;
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}
