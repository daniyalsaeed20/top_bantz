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
      user_id: '1',
      message: "Hello",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "Hi",
      type: "vid",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "How are you?",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "I am fine what about you?",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '2',
      message: "Never better.",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "Never better.",
      type: "aud",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "Never better.",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "How is life treaating you these days?",
      type: "txt",
    ),
    ChatMessageModel(
      user_id: '1',
      message: "Its been busy",
      type: "img",
    ),
  ];

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

  chatTemp() {
    messages.add(
      ChatMessageModel(
          message: sendMessageController.text, type: "txt", user_id: '1'),
    );
    messages.add(
      ChatMessageModel(message: "What do you mean?", type: "txt", user_id: '2'),
    );
    update();
    sendMessageController.text = "";
  }
}
