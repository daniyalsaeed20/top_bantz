import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';

Widget textBubble({
  color = Colors.grey,
  text = "",
  textColor,
}) {
  return Container(
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
      borderRadius: BorderRadius.circular(
        4.r,
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
  );
}

Widget showMessage({required ChatMessageModel messageModel}) {
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
      child: textBubble(
        color: messageModel.user_id == "2"
            ? CustomColors.themeColor
            : Colors.white,
        text: messageModel.message,
        textColor: messageModel.user_id == "2" ? Colors.white : Colors.black,
      ),
    ),
  );
}
