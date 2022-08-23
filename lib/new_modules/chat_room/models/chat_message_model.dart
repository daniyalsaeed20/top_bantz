class ChatMessageModel {
  ChatMessageModel({
    required this.type,
    required this.message,
    required this.user_id,
  });
  String user_id;
  String type;
  String message;
}
