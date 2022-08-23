import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_bantz/create-account/login%20screen.dart';
import 'package:top_bantz/create-account/registration%20screen.dart';

import '../bottom_navigation/home_page.dart';
class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*.1,
              ),
              Container(
                width: size.width*.90,
                  height: size.height*.39,
                  child: Image.asset('assets/images/image.png')),
              SizedBox(
                height: size.height*.056,
              ),
              Container(
                height: size.height*.09,
                width: size.width*.80,
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height*.09,
                        width: size.width*.55,
                        child: Text("Best Football Community",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),
                  ],
                ),
              ),
              Container(
                height: size.height*.09,
                width: size.width*.80,
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height*.09,
                        width: size.width*.60,
                        child: Text("Discuss your favourite football teams with fellow supporters and receive the "
                            "latest game updates.",style: TextStyle(fontSize: 12,color: Color(0xff65656B),fontWeight:
                        FontWeight.w500),)),
                  ],
                ),
              ),
              SizedBox(
                height: size.height*.056,
              ),
              Container(
                height: size.height*.09,
                width: size.width*.80,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.height*.06:
                      size.height*.08,
                      width: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.width*.45:
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
                          onPressed: () async {
                            // bool check=await storageget();
                            // storageset();
                            // if(check==true){
                            //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                            // }
                            // else{
                            //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                            // }

                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => LoginScreen(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign in'
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
                    Container(
                      height: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.height*.06:
                      size.height*.08,
                      width: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.width*.35:
                      size.width*.40,
                      // color: Colors.blue,
                      //   alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.topCenter,
                        //   stops: [0.0, 1.0],
                        //   colors: [
                        //     Color(0xffE0B108),
                        //     Color(0xffF1E291),
                        //
                        //
                        //   ],
                        // ),
                       // color: Colors.blue,
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
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Sign_up(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign UP '
                                ,textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffC4C4C4),
                                    letterSpacing: .05,
                                    fontSize: 12
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
      )

    );
  }
  // storageget()async{
  //   final prefs=await SharedPreferences.getInstance();
  //   bool ok=prefs.getBool("ok")??false;
  //   return ok;
  // }
  // storageset()async{
  //   final prefs= await SharedPreferences.getInstance();
  //   prefs.setBool("ok", true);
  // }
}
