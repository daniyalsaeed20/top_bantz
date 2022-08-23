import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';

class AudioBox extends StatelessWidget {
  AudioBox({Key? key, required this.messageModel}) : super(key: key);

  ChatMessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messageModel.user_id == "2"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16,
          left: messageModel.user_id == "2" ? 48 : 16,
          right: messageModel.user_id == "2" ? 16 : 48,
          top: 8,
        ),
        child: Container(
          height: 75.h,
          width: 250.w,
          decoration: BoxDecoration(
            color: messageModel.user_id == "1"
                ? CustomColors.backGroundColor
                : CustomColors.themeColor,
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
              color: messageModel.user_id == "2"
                  ? CustomColors.backGroundColor
                  : CustomColors.themeColor,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.multitrack_audio,
                  color: messageModel.user_id == "2"
                      ? CustomColors.backGroundColor
                      : CustomColors.themeColor,
                ),
                SizedBox(
                  width: 150.w,
                  child: LinearProgressIndicator(
                    color: messageModel.user_id == "1"
                        ? CustomColors.backGroundColor
                        : CustomColors.themeColor,
                    backgroundColor: messageModel.user_id == "2"
                        ? CustomColors.backGroundColor
                        : CustomColors.themeColor,
                  ),
                ),
                Icon(
                  Icons.play_arrow,
                  color: messageModel.user_id == "2"
                      ? CustomColors.backGroundColor
                      : CustomColors.themeColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
