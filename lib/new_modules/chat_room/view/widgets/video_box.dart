// ignore_for_file: no_logic_in_create_state

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/controller/message_controller.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:video_player/video_player.dart';

class VideoBox extends StatefulWidget {
  VideoBox({Key? key, required this.messageModel, required this.userModel})
      : super(key: key);

  ChatMessageModel messageModel;
  UserModel userModel;

  @override
  State<VideoBox> createState() => _VideoBoxState(
        url: messageModel.message,
        userModel: userModel,
      );
}

class _VideoBoxState extends State<VideoBox> {
  late VideoPlayerController controller;

  _VideoBoxState({
    required this.url,
    required this.userModel,
  });

  UserModel userModel;

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
    return GetBuilder<MessageController>(
        init: MessageController(),
        builder: (messageController) {
          return Align(
            alignment: widget.messageModel.send_by == userModel.fullname
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 16,
                left:
                    widget.messageModel.send_by == userModel.fullname ? 48 : 16,
                right:
                    widget.messageModel.send_by == userModel.fullname ? 16 : 48,
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
                child:
                    //  messageController.videoUrl != 'null'
                    //     ?
                    Chewie(
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
                // : Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        });
  }
}
