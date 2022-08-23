class MessageModel {
  String? messageid;
  String? sender;
  String? text;
  String? type;
  String? img;
  bool? seen;
  DateTime? createdon;

  MessageModel({this.messageid, this.sender, this.text, this.seen, this.createdon,this.type,this.img});

  MessageModel.fromMap(Map<String, dynamic> map) {
    messageid = map["messageid"];
    sender = map["sender"];
    text = map["text"];
    type =map['type'];
    img =map['img'];
    seen = map["seen"];
    createdon = map["createdon"].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "messageid": messageid,
      "sender": sender,
      "text": text,
      "type": type,
      "img" : img,
      "seen": seen,
      "createdon": createdon
    };
  }
}