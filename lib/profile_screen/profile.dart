import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/profile_screen/profile_details/change_hair_style.dart';
import 'package:top_bantz/profile_screen/profile_details/change_outfit.dart';
import 'package:top_bantz/profile_screen/profile_details/change_selfie.dart';

import '../select_avatar.dart';
class Profile extends StatefulWidget {

   Profile({Key? key,}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<String> text=['Change Outfit','Change Avatar','Change Hair Style','Change Selfie'];
  List<String> images=['assets/images/icon/sweater.png','assets/images/icon/face-recognition.png',
    'assets/images/icon/hairstyle.png','assets/images/icon/camera.png'];

FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff212020),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height*.1,
            ),
            Stack(
              children: [


            StreamBuilder<List<UserModel>>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .where("uid", isEqualTo: _auth.currentUser!.uid)
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
          builder: (context, snapshot){
            UserModel userModel =
            snapshot.data![0];
            if (snapshot.hasData){ return  Container(

                width: size.width,
                height: size.height*.39,
                //   color: Colors.red,
                child: CachedNetworkImage(imageUrl:userModel.profilepic
                    .toString(),));} else {
            return Container(
            child: CircularProgressIndicator(),
            );
            }

          }

                ),
                Positioned(
                  right: 90,
                  top: 20,
                  child: Container(
                      alignment: Alignment.center,
                      height: size.height*.03,
                      width: size.width*.15,
                      decoration: BoxDecoration(
                        color: Color(0xff000000
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text("Share",style: TextStyle(fontSize: 10,
                          color: Colors.white,fontWeight: FontWeight.w900),)),
                ),

              ],

            ),
            SizedBox(
              height: size.height*.04,
            ),
            Container(
              height: size.height*.4,
              width: size.width,
              color: Colors.black,
              child: ListView.builder(
                itemCount: 4,
                  itemBuilder: (context,int index){
                  return GestureDetector(
                    onTap: (){
                      if(text[index]=="Change Outfit"){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => Change_outfit(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      }
                      else if(text[index]=="Change Avatar"){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => SelectAvatar(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      }
                      else if(text[index]=="Change Hair Style"){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => Change_hair_style(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      }
                      else if(text[index]=="Change Selfie"){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => Change_Selfie(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: size.height*.08,
                       width: size.width*.80,
                      child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width*.08,
                          ),
                          Container(
                              width: size.width*.1,
                              height: size.height*.04,
                              child: Image.asset(images[index].toString())),
                          SizedBox(
                            width: size.width*.08,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              //height: size.height*.06,
                             width: size.width*.40,
                              child: Text(text[index].toString(),style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),)),
                          SizedBox(
                            width: size.width*.20,
                          ),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)

                        ],

                      ),
                    ),
                  );
                  }

              ),
            ),
            Container(
              width: size.width,
              height: size.height*.06,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).orientation==Orientation.portrait?
                    size.height*.06:
                    size.height*.08,
                    width: MediaQuery.of(context).orientation==Orientation.portrait?
                    size.width*.40:
                    size.width*.40,
                    // color: Colors.blue,
                    //   alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xffE0B108),
                          Color(0xffF1E291),


                        ],
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          //  minimumSize: MaterialStateProperty.all(Size(width, 50)),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          // elevation: MaterialStateProperty.all(3),
                          shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   PageRouteBuilder(
                          //     pageBuilder: (c, a1, a2) => SetUp_Company(),
                          //     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                          //     transitionDuration: Duration(milliseconds: 100),
                          //   ),
                          // );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Save'
                              ,textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: .05,
                                  fontSize: 15
                              ),
                            ),
                            //   Icon(Icons.arrow_forward)
                          ],
                        )

                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

