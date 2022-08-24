import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';

class ImageBox extends StatelessWidget {
  ImageBox({Key? key, required this.messageModel}) : super(key: key);

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
          constraints: BoxConstraints(
            maxWidth: 200.w,
          ),
          height: 200.h,
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
          child: CachedNetworkImage(
            imageUrl: messageModel.message.toString() != ""
                ? messageModel.message.toString()
                : "Loading",
            fit: BoxFit.fitHeight,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => messageModel.message != ""
                ? const Icon(Icons.refresh)
                : const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
