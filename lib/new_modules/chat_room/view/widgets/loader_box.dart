import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';

class LoaderBox extends StatelessWidget {
  LoaderBox({Key? key, required this.messageModel, required this.userModel})
      : super(key: key);

  ChatMessageModel messageModel;
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messageModel.send_by == userModel.fullname
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16,
          left: messageModel.send_by == userModel.fullname ? 48 : 16,
          right: messageModel.send_by == userModel.fullname ? 16 : 48,
          top: 8,
        ),
        child: Container(
            constraints: BoxConstraints(
              maxWidth: 100.w,
            ),
            height: 100.h,
            // width: 200.w,
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
            child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
