import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';

class MessageController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  TextEditingController sendMessageController = TextEditingController();

  /* -------------------------------------------------------------------------- */
  /*                                    Lists                                   */
  /* -------------------------------------------------------------------------- */

  // List<MessageModel> messages = [];

  List<ChatMessageModel> messages = [
    ChatMessageModel(
      user_id: '2',
      message: "Hello",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '1',
      message: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      type: "vid",
    ),
    ChatMessageModel(
      user_id: '1',
      message: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      type: "vid",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "How are you?",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
      type: "img",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "Never better.",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "How is life treating you these days?",
      type: "txt",
    ),
  ];

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

  chatTemp() {
    messages.add(
      ChatMessageModel(
          message: sendMessageController.text, type: "txt", user_id: '2'),
    );
    messages.add(
      ChatMessageModel(message: "What do you mean?", type: "txt", user_id: '1'),
    );
    update();
    sendMessageController.text = "";
  }
}
