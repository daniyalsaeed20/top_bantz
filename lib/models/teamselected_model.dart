class TeamSelected {
  String? uid;
  String? text;
  String? images;


  TeamSelected({this.uid, this.text, this.images, });

  TeamSelected.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    text = map["text"];
    images = map["images"];

  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "text": text,
      "images": images,

    };
  }
}