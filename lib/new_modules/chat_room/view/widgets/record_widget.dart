import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_bantz/bottom_navigation/chatroom.dart';
import 'package:top_bantz/main.dart';
import 'package:top_bantz/models/ChatRoomModel.dart';
import 'package:top_bantz/models/MessageModel.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/audio_texts/audio_bloc/audio_bloc.dart';
import 'package:top_bantz/new_modules/audio_texts/sound_recorder.dart';
import 'package:uuid/uuid.dart';

class RecordButton extends StatefulWidget {
  RecordButton(
      {Key? key,
      required this.chatroom,
      this.groupchatId = '',
      this.isGroup = false})
      : super(key: key);

  final ChatRoomModel? chatroom;
  String groupchatId;
  bool isGroup;

  @override
  State<RecordButton> createState() => _RecordButtonState(
      chatroom: chatroom, groupchatId: groupchatId, isGroup: isGroup);
}

class _RecordButtonState extends State<RecordButton> {
  _RecordButtonState(
      {required this.chatroom,
      required this.groupchatId,
      required this.isGroup});
  final recorder = SoundRecorder();
  final ChatRoomModel? chatroom;
  final String groupchatId;
  final bool isGroup;

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recorder.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRecording = recorder.isRecording;

    IconData icon = Icons.mic;
    Color iconColor = Colors.blue;
    return BlocConsumer<AudioBloc, AudioState>(
      listener: (context, state) {
        if (state is IsRecordingState) {
          icon = Icons.stop;
          iconColor = Colors.red;
        } else if (state is IsNotRecordingState) {
          icon = Icons.mic;
          iconColor = Colors.blue;
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state is IsRecordingState) RecordTimer(isGroup: isGroup),
            InkWell(
              onTap: () async {
                await recorder.toggleRecording();
                if (state is IsNotRecordingState) {
                  BlocProvider.of<AudioBloc>(context).add(IsRecordingEvent());
                } else {
                  BlocProvider.of<AudioBloc>(context)
                      .add(IsNotRecordingEvent());
                  var file = await recorder.getAudioPath();
                  if (!isGroup) {
                    uploadAudio(file);
                  } else {
                    uploadAudioForGroup(file, groupchatId);
                  }
                }
              },
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ],
        );
      },
    );
  }

  Future uploadAudio(audioFile) async {
    String fileName = Uuid().v1();
    User? user = _auth.currentUser;

    String audio = "audio";
    int status = 1;
    MessageModel newMessage = MessageModel(
      messageid: uuid.v1(),
      sender: user!.uid,
      createdon: DateTime.now(),
      text: audio,
      img: audio,
      type: audio,
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

    var uploadTask =
        await ref.putFile(File(audioFile)).catchError((error) async {
      await _firestore
          .collection('chatrooms')
          .doc(chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String audioUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatrooms')
          .doc(chatroom!.chatroomid)
          .collection('messages')
          .doc(newMessage.messageid)
          .update({
        "text": audio,
        "img": audioUrl,
      });

      widget.chatroom!.lastMessage = audio;
      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatroom!.chatroomid)
          .set(widget.chatroom!.toMap());

      print(audioUrl);
    }

    print(uploadTask);
  }

  Future uploadAudioForGroup(audioFile, groupChatId) async {
    String fileName = Uuid().v1();
    User? user = _auth.currentUser;

    String video = "audio";
    int status = 1;

    UserModel? usermodel = await FirebaseHelper.getUserModelById(
        _auth.currentUser!.uid.toString());

    Map<String, dynamic> chatData = {
      "sendBy": usermodel!.fullname,
      "message": 'null',
      "type": "audio",
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

    var uploadTask =
        await ref.putFile(File(audioFile)).catchError((error) async {
      await _firestore
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .delete();

      status = 0;
    });
    if (status == 1) {
      String audioUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .doc(docId)
          .update({
        "type": video,
        "message": audioUrl,
      });

      print(audioUrl);
    }
  }
}

class RecordTimer extends StatefulWidget {
  RecordTimer({Key? key, this.starter = true, this.isGroup = false})
      : super(key: key);

  bool starter;
  bool isGroup;

  @override
  State<RecordTimer> createState() =>
      _RecordTimerState(starter: starter, isGroup: isGroup);
}

class _RecordTimerState extends State<RecordTimer> {
  _RecordTimerState({
    required this.starter,
    required this.isGroup,
  });
  Duration duration = Duration();
  Timer? timer;

  bool starter;
  bool isGroup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (starter) startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$minutes : $seconds',
      style: TextStyle(
        color: isGroup ? Colors.black : Colors.white,
      ),
    );
  }
}