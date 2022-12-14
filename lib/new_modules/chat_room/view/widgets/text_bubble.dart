import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';

Widget textBubble(
    {color = Colors.grey,
    text = "",
    textColor,
    time = '00:00',
    messageModel,
    userModel}) {
  return Column(
    crossAxisAlignment: messageModel.send_by == userModel.fullname
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start,
    children: [
      if (messageModel.send_by != userModel.fullname)
        CustomText(
          alignment: TextAlign.end,
          text: userModel.fullname,
          color: CustomColors.textMediumColor,
          fontSize: 12.sp,
        ),
      Container(
        // width: 500.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
            bottomLeft: messageModel.send_by == userModel.fullname
                ? Radius.circular(8.r)
                : Radius.circular(0.r),
            bottomRight: messageModel.send_by == userModel.fullname
                ? Radius.circular(0.r)
                : Radius.circular(8.r),
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            alignment: TextAlign.left,
            text: text,
            color: textColor,
            maxLines: 100,
            fontSize: 16.sp,
          ),
        ),
      ),
      CustomText(
        alignment: TextAlign.end,
        text: time,
        color: CustomColors.textMediumColor,
        fontSize: 12.sp,
      ),
    ],
  );
}

Widget showMessage({
  required ChatMessageModel messageModel,
  required UserModel userModel,
}) {
  final Timestamp timestamp = messageModel.time as Timestamp;
  final DateTime dateTime = timestamp.toDate();
  final dateString = DateFormat('MMM d, h:mma').format(dateTime);
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
      child: textBubble(
        messageModel: messageModel,
        userModel: userModel,
        color: messageModel.send_by == userModel.fullname
            ? CustomColors.themeColor
            : Colors.white,
        text: messageModel.message,
        textColor: messageModel.send_by == userModel.fullname
            ? Colors.white
            : Colors.black,
        time: dateString,
      ),
    ),
  );
}
