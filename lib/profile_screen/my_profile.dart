import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/profile_screen/payment_selection.dart';
import 'package:top_bantz/profile_screen/profile.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import '../create-account/starting_screen.dart';
import '../models/methods.dart';
import 'chat_support.dart';
import 'email_support.dart';
import 'package:path/path.dart' as Path;

import 'my_profile_screen_class/about.dart';
import 'my_profile_screen_class/about2.dart';
import 'my_profile_screen_class/about3.dart';

class My_profile extends StatefulWidget {
  const My_profile({
    Key? key,
  }) : super(key: key);

  @override
  _My_profileState createState() => _My_profileState();
}

class _My_profileState extends State<My_profile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedValue = 1;
  String? myName;
  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()!['fullname'];

        // print(myEmail);
      }).catchError((e) {
        print(e);
      });
    }
  }

  File? image;
  bool isLoading = false;
  //FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static List<String> _idCardImages = [];
  late PickedFile _pickedFile;
  _imgFromCamera() async {
    _pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50))!;
    setState(() {
      print('List Printed');
      getUrl(_pickedFile.path).then((value) {
        if (value != null) {
          setState(() {
            _idCardImages.add(value);
            isLoading = false;
          });
        } else {
          print('sorry error');
        }
      });
    });
  }

  _imgFromGallery() async {
    _pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50))!;
    setState(() {
      print('List Printed');
      getUrl(_pickedFile.path).then((value) {
        if (value != null) {
          setState(() {
            _idCardImages.add(value);
            isLoading = false;
          });
        } else {
          print('sorry error');
        }
      });
    });
  }

  Future<String?> getUrl(String path) async {
    User? users = _auth.currentUser;
    final file = File(path);
    String imageurl = '';
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("image" + DateTime.now().toString())
        .putFile(file);
    if (snapshot.state == TaskState.success) {
      imageurl = await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('Users').doc(users!.uid).update({
        'profilepic': imageurl,

      });
    }
    print(_idCardImages.length.toString() + " HTTPS://F");
    print(_idCardImages);
    print(_idCardImages);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
   // log(_auth.currentUser!.uid.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Container(
            height: size.height * .085,
            width: size.width * 2,
            child: Image.asset('assets/images/splash_image.png')),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // physics: MediaQuery.of(context).size.height>450.0 &&
        //     MediaQuery.of(context).size.height<=640.0?ScrollPhysics():NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .04,
            ),
            Stack(
              fit: StackFit.passthrough,
              children: [

                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                      setState(() {
                        isLoading = true;
                      });
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xffFDCF09),
                      child:Container(
                              // height: size.height * 0.12,
                              //  width: size.width*.7,
                              child: StreamBuilder<List<UserModel>>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Users')
                                      .where("uid", isEqualTo: _auth.currentUser!.uid.toString())
                                      .snapshots()
                                      .map((event) => event.docs
                                          .map((e) => UserModel(
                                                ContactNo: e.get("ContactNo"),
                                                Dateofbirth: e.get("Dateofbirth"),
                                                password: e.get("password"),
                                                profilepic: e.get("profilepic"),
                                                uid: e.get("uid"),
                                                fullname: e.get("fullname"),
                                                email: e.get("email"),
                                              ))
                                          .toList()),
                                  builder: (context, snapshot) {
                                       if (snapshot.hasData){
                                         return  ListView.builder(
                                           //   scrollDirection: Axis.horizontal,
                                           // shrinkWrap: true,
                                             itemCount: snapshot.data!.length,
                                             itemBuilder:
                                                 (BuildContext context, int index) {
                                               UserModel userModel =
                                               snapshot.data![index];
                                               log(userModel.profilepic.toString());
                                               log(userModel.uid.toString());
                                               return Container(
                                                 width: 110,
                                                 height: 110,
                                                 child: ClipRRect(
                                                   borderRadius:
                                                   BorderRadius.circular(100),
                                                   child:userModel.profilepic == null || userModel.profilepic!.isEmpty
                                                       ? ClipRRect(
                                                     borderRadius: BorderRadius.circular(10),
                                                     child: Image.asset(
                                                       'assets/images/icon/download.jpg',
                                                       width: 90,
                                                       height: 100,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ):
                                                   CachedNetworkImage(
                                                     fit: BoxFit.cover,
                                                     imageUrl: userModel.profilepic
                                                         .toString()
                                                   ),
                                                 ),
                                               );
                                             }) ;
                                       } else {
                                         return Container(
                                           child: CircularProgressIndicator(),
                                         );
                                       }

                                  }),
                            ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.height * .12,
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      height: size.height * .07,
                      width: size.width * .15,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Color(0xffe9b245)),
                          shape: BoxShape.circle),
                    ),
                    Container(
                        height: size.height * .06,
                        width: size.width * .1,
                        child: Image.asset('assets/images/leagues/barcelona.png'))
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  right: size.height * .15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Profile(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        height: size.height * .07,
                        width: size.width * .15,
                        decoration: BoxDecoration(
                            color: Color(0xfff4a58a),
                            border: Border.all(color: Color(0xffe9b245)),
                            shape: BoxShape.circle),
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      )
                      // Container(
                      //     height: size.height*.06,
                      //     width: size.width*.1,
                      //     child: Image.asset('assets/images/leagues/barcelona.png'))
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: FutureBuilder(
                future: _fetch(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Text("Loading data...Please wait");
                  return Container(
                      alignment: Alignment.center,
                      height: size.height * .05,
                      width: size.width * .85,
                      child: Text(
                        "$myName",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ));
                },
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: size.height * .03,
                width: size.width * .85,
                child: Text(
                  "#YNWK till the end 🔥",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
            Container(
              height: size.height * .06,
              width: size.width * .85,
              decoration: BoxDecoration(
                  color: Color(0xff212020),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: size.height * .05,
                      width: size.width * .20,
                      child: Text(
                        "Your Coins",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffe9B245),
                            fontWeight: FontWeight.w900),
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      height: size.height * .05,
                      width: size.width * .48,
                      child: Text(
                        "100",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      )),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  Container(
                      height: size.height * .085,
                      width: size.width * .1,
                      child: Image.asset('assets/images/leagues/coins.png')),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .04,
            ),
            Container(
              width: size.width,
              // color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: 1,
                  //   padding: EdgeInsets.all(value),
                  // height: 50,
                  innerPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  // innerPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 1),
                  fromMax: true,
                  // isStretch: true,
                  children: {
                    1: segmented(
                        text: "MyProfile",
                        color: _selectedValue == 1 ? Colors.white : Colors.white),
                    2: segmented(
                        text: "Activity",
                        color: _selectedValue == 2 ? Colors.white : Colors.white),
                    3: segmented(
                        text: "Settings",
                        color: _selectedValue == 3 ? Colors.white : Colors.white),
                  },
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(0),
                    // border: Border.all
                    //   (
                    //  //   color: Colors.red,
                    //     width: 0),
                  ),
                  thumbDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      colors: [
                        Color(0xffE0B108),
                        Color(0xffF1E291),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // duration: Duration(milliseconds: 300),
                  // curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    print(v.toString());
                    setState(() {
                      //  print('v');
                      _selectedValue = v;
                    });
                  },
                ),
              ),
            ),
            buildSegmented(),
          ],
        ),
      ),
    );
  }

  Widget segmented({required String text, required Color color}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "Lato",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buildSegmented() {
    print('selected value' + _selectedValue.toString());
    switch (_selectedValue) {
      case 1:
        return const About();
      case 2:
        return About2();
      case 3:
        return About3();

      default:
        return const About();
    }
  }
}




