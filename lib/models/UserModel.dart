class UserModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;
  String? password;
  String? ContactNo;
  String? Dateofbirth;

  UserModel({this.uid, this.fullname, this.email, this.profilepic,this.password,this.ContactNo,this.Dateofbirth});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilepic = map["profilepic"];
    password = map["password"];
    ContactNo = map["ContactNo"];
    Dateofbirth = map["Dateofbirth"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilepic": profilepic,
      "password": password,
      "ContactNo": ContactNo,
      "Dateofbirth": Dateofbirth,
    };
  }
}