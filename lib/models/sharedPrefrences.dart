import 'package:shared_preferences/shared_preferences.dart';
import 'UserModel.dart';


class MySharedPrefrences {
  static const  userIdKey = 'userIdKey';
  static const  userFullNamekey = 'userFullNamekey';
  static const  userEmailkey = 'userEmailkey';
  static const  userPasswordkey = 'userPasswordkey';
  static setUserData({required UserModel userModel}) async {

    await SharedPreferences.getInstance().then((value) {
      // value.setInt(Constant.userIdKey, userModel.uid!);
      value.setString(userIdKey, userModel.uid.toString());
      value.setString(userFullNamekey, userModel.fullname.toString());
      value.setString(userEmailkey, userModel.email.toString());
    //  value.setString(userPasswordkey, userModel.password!);
    });
  }

  static Future<UserModel> getUserData() async {
    late UserModel _userModel;
    await SharedPreferences.getInstance().then((value) {
      // null hendling
      value.getString(userIdKey) ??
          value.setString(userIdKey, "");


      value.getString(userFullNamekey) ??
          value.setString(userFullNamekey, "");

      value.getString(userEmailkey) ??
          value.setString(userEmailkey, "");

      _userModel = UserModel(
        // uid: value.getInt(Constant.userIdKey),
        uid: value.getString(userIdKey)!,
        fullname: value.getString(userFullNamekey)!,
        email: value.getString(userEmailkey)!,
      //  password: value.getString(Constant.userPasswordkey),
      );
    });

    return _userModel;
  }

  static Future clearUserData() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
  }
}