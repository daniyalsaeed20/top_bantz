// ignore_for_file: no_logic_in_create_state

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:video_player/video_player.dart';

class VideoBox extends StatefulWidget {
  VideoBox({Key? key, required this.messageModel}) : super(key: key);

  ChatMessageModel messageModel;

  @override
  State<VideoBox> createState() => _VideoBoxState(
        url: messageModel.message,
      );
}

class _VideoBoxState extends State<VideoBox> {
  late VideoPlayerController controller;

  _VideoBoxState({required this.url});

  String url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.network(url)
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.messageModel.user_id == "2"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16,
          left: widget.messageModel.user_id == "2" ? 48 : 16,
          right: widget.messageModel.user_id == "2" ? 16 : 48,
          top: 8,
        ),
        child: Container(
          height: 200.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: CustomColors.backGroundColor,
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackColor.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
            border: Border.all(
              width: 2,
              color: CustomColors.themeColor,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Chewie(
            controller: ChewieController(
              allowFullScreen: true,
              errorBuilder: (context, error) => '' != ""
                  ? InkWell(
                      onTap: () => setState(() {}),
                      child: const Icon(Icons.refresh))
                  : const Icon(Icons.error),
              showControls: true,
              videoPlayerController: controller,
              autoPlay: false,
              looping: false,
              hideControlsTimer: const Duration(seconds: 1),
            ),
          ),
        ),
      ),
    );
  }
}
