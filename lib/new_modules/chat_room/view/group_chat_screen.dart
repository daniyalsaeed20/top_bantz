import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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

PanelController panelController = PanelController();

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
        body: SlidingUpPanel(
          controller: panelController,
          maxHeight: 100.h,
          minHeight: 0.h,
          parallaxEnabled: true,
          parallaxOffset: 1,
          color: CustomColors.foreGroundColor.withOpacity(0.8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r), topRight: Radius.circular(18.r)),
          panel: Panel(),
          body: Body(),
        ),
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
              SizedBox(
                height: 700.h,
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
      return ImageBox(
        messageModel: chatMessageModel,
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
        ),
        MultiMediaOption(
          icon: Icons.video_camera_back_outlined,
          title: 'Upload Video',
        ),
      ],
    );
  }
}

openPanel() {
  if (panelController.isPanelClosed) {
    panelController.open();
  } else {
    panelController.close();
  }
}
