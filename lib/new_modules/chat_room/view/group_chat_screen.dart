import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/controller/message_controller.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/audio_box.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/chat_room_text_field.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/image_box.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/multi_media_options.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/text_bubble.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/video_box.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.foreGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.transparentColor,
          title: CustomText(
            text: 'Chat Room',
            fontSize: 18.sp,
          ),
          centerTitle: true,
          leading: Icon(Icons.menu),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      init: MessageController(),
      builder: (messageController) {
        return SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0;
                          i < messageController.messages.length;
                          i++)
                        ChatUiSelector(
                          chatMessageModel: messageController.messages[i],
                        )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 5.w,
                      ),
                      child: ChatRoomTextField(
                        title: 'Write a reply...',
                        controller: messageController.sendMessageController,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => openPanel(),
                    child: const Icon(
                      Icons.more_vert,
                      color: CustomColors.textWhiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      messageController.chatTemp();
                    },
                    child: const Icon(
                      Icons.send,
                      color: CustomColors.themeColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatUiSelector extends StatelessWidget {
  ChatUiSelector({Key? key, required this.chatMessageModel}) : super(key: key);
  ChatMessageModel chatMessageModel;

  @override
  Widget build(BuildContext context) {
    if (chatMessageModel.type == 'txt') {
      return showMessage(messageModel: chatMessageModel);
    }
    if (chatMessageModel.type == 'vid') {
      return VideoBox(
        messageModel: chatMessageModel,
      );
    }
    if (chatMessageModel.type == 'img') {
      return InkWell(
        onTap: () => viewImageDialog(url: chatMessageModel.message,context: context),
        child: ImageBox(
          messageModel: chatMessageModel,
        ),
      );
    }
    if (chatMessageModel.type == 'aud') {
      return AudioBox(
        messageModel: chatMessageModel,
      );
    }
    return SizedBox();
  }
}

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MultiMediaOption(
          icon: Icons.mic,
          title: 'Record Audio',
        ),
        MultiMediaOption(
          icon: Icons.image,
          title: 'Upload Image',
          onTap: () {
            multiMediaOptionsDialog(title: 'Upload Image');
          },
        ),
        MultiMediaOption(
          icon: Icons.video_camera_back_outlined,
          title: 'Upload Video',
          onTap: () {
            multiMediaOptionsDialog(title: 'Upload Video');
          },
        ),
      ],
    );
  }
}

dynamic openPanel() {
  multiMediaDialog();
}

dynamic multiMediaOptionsDialog({
  required String title,
}) {
  return Get.defaultDialog(
    title: title,
    middleText: '',
    actions: [
      MultiMediaOption(
        icon: Icons.camera_alt_outlined,
        title: 'From Camera',
      ),
      MultiMediaOption(
        icon: Icons.image_outlined,
        title: 'From Gallery',
      ),
    ],
    backgroundColor: CustomColors.themeColor.withOpacity(0.8),
    titleStyle: TextStyle(
      color: CustomColors.textWhiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    radius: 4.r,
  );
}

dynamic multiMediaDialog() {
  return Get.defaultDialog(
    title: 'Upload Multimedia',
    middleText: '',
    actions: [Panel()],
    backgroundColor: CustomColors.themeColor.withOpacity(0.8),
    titleStyle: TextStyle(
      color: CustomColors.textWhiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    radius: 4.r,
  );
}

dynamic viewImageDialog({required BuildContext context,required String url}) {
  

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
