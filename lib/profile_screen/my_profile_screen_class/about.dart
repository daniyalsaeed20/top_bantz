import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/methods.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<String> setimage = [
    'assets/images/icon/Vector.png',
    'assets/images/icon/email.png',
    'assets/images/icon/chat.png',
    'assets/images/icon/donate.png'
  ];

  List<String> name = ['name', 'Email', 'Phone', 'Adress'];
  List<String> email = ['Shahid', 'shahid@gmail.com', '034354874756', 'karak'];
  String? myEmail;
  String? myname;
  String? myphone;

  FirebaseAuth _auth = FirebaseAuth.instance;
  MethodsHandler _methods = MethodsHandler();
  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.white,
      child: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text(
                "Loading data...Please wait",
              );
            return Column(
              children: [
                Container(
                  width: size.width * .90,
                  child: Row(
                    children: [
                      Container(
                          height: size.height * .02,
                          width: size.width * .1,
                          child: Image.asset(
                            'assets/images/icon/Vector.png',
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: size.width * .59,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "$myname",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  width: size.width * .90,
                  child: Row(
                    children: [
                      Container(
                          height: size.height * .02,
                          width: size.width * .1,
                          child: Image.asset(
                            "assets/images/icon/email.png",
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: size.width * .59,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "$myEmail",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  width: size.width * .90,
                  child: Row(
                    children: [
                      Container(
                          height: size.height * .02,
                          width: size.width * .1,
                          child: Image.asset(
                            'assets/images/icon/chat.png',
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: size.width * .59,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "$myphone",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  width: size.width * .90,
                  child: Row(
                    children: [
                      Container(
                          height: size.height * .02,
                          width: size.width * .1,
                          child: Image.asset(
                            'assets/images/icon/donate.png',
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: size.width * .59,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Adress",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email : $myEmail()",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                GestureDetector(
                  onTap: () {
                    _methods.signOut(context);
                  },
                  child: Container(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );

  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myEmail = ds.data()!['email'];
        myname = ds.data()!['fullname'];
        myphone = ds.data()!['ContactNo'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
    }
  }
}