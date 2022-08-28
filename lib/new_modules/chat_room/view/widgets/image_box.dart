import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';

class ImageBox extends StatelessWidget {
  ImageBox({Key? key, required this.messageModel, required this.userModel})
      : super(key: key);

  ChatMessageModel messageModel;
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = messageModel.time as Timestamp;
    final DateTime dateTime = timestamp.toDate();
    final dateString = DateFormat('M/d, HH:mm').format(dateTime);
    return Column(
      crossAxisAlignment: messageModel.send_by == userModel.fullname
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        if (messageModel.send_by != userModel.fullname)
          Padding(
            padding: EdgeInsets.only(
              left: messageModel.send_by == userModel.fullname ? 48 : 16,
              right: messageModel.send_by == userModel.fullname ? 16 : 48,
            ),
            child: CustomText(
              alignment: TextAlign.end,
              text: userModel.fullname,
              color: CustomColors.textMediumColor,
              fontSize: 12.sp,
            ),
          ),
        Align(
          alignment: messageModel.send_by == userModel.fullname
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: messageModel.send_by == userModel.fullname ? 48 : 16,
              right: messageModel.send_by == userModel.fullname ? 16 : 48,
              top: 8,
            ),
            child: InkWell(
              onTap: () =>
                  viewImageDialog(url: messageModel.message, context: context),
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
                  errorWidget: (context, url, error) =>
                      messageModel.message != ""
                          ? const Icon(Icons.refresh)
                          : const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 16,
            left: messageModel.send_by == userModel.fullname ? 48 : 16,
            right: messageModel.send_by == userModel.fullname ? 16 : 48,
          ),
          child: CustomText(
            alignment: TextAlign.end,
            text: dateString,
            color: CustomColors.textMediumColor,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

dynamic viewImageDialog({required BuildContext context, required String url}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text("Simple Alert"),
        // content: Text("This is an alert message."),
        actions: [
          CachedNetworkImage(
            imageUrl: url != "" ? url : "Loading",
            fit: BoxFit.fitHeight,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                url != "" ? const Icon(Icons.refresh) : const Icon(Icons.error),
          ),
        ],
      );
    },
  );
}
