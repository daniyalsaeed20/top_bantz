import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:top_bantz/create-account/login%20screen.dart';

import '../select_subscription.dart';
class SelectTeam extends StatefulWidget {
  const SelectTeam({Key? key}) : super(key: key);

  @override
  _SelectTeamState createState() => _SelectTeamState();
}

class _SelectTeamState extends State<SelectTeam> {
  int selectedCard = -1;
  List<String> text= ['Group1','Group2','Group3','Group4','Group5','Group6','Group7','Group8','Group9','Group10','Group11','Group12',
    'Group13'];
  List<String> images = ['assets/images/icon/camera.png','assets/images/leagues/Vector.png','assets/images/leagues/barcelona.png',
 'assets/images/leagues/English_Football_League_Logo.png','assets/images/leagues/spain.png','assets/images/leagues/LaLiga_Santander_logo.png',
    'assets/images/leagues/UEFA_Champions_League_logo_2.png','assets/images/icon/camera.png','assets/images/leagues/Vector.png','assets/images/leagues/barcelona.png',
    'assets/images/leagues/English_Football_League_Logo.png','assets/images/leagues/spain.png','assets/images/leagues/LaLiga_Santander_logo.png',
    'assets/images/leagues/UEFA_Champions_League_logo_2.png'
  ];
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _key,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*.05,
              ),
              Container(
                width: size.width*.90,
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height*.09,
                        width: size.width*.65,
                        child: Text("Select The Team You Support",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900),)),

                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  height: size.height*.06,
                  width: size.width*.90,
                  child: Text("You can choose more than one",style: TextStyle(fontSize: 12,color: Color(0xff65656b),fontWeight: FontWeight.w900),)),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                   //  height: size.height*0.32,
                    child:  GridView.builder(
                      //shrinkWrap: true,
                      itemCount: images.length,
                      //images.length,

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   4,
                          //mainAxisSpacing: 2
                          mainAxisExtent: 65,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                        // (orientation == Orientation.portrait) ? 2 : 3
                      ),
                      itemBuilder: (BuildContext context, int index) {

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // ontap of each card, set the defined int to the grid view index
                              selectedCard = index;
                              print(selectedCard);
                            });
                          },
                          child: Stack(
                alignment: Alignment.center,
                children:[
                  Container(
                  height: size.height*.075,
                  width: size.width*.19,

                  decoration: BoxDecoration(
                      color: selectedCard == index ?Colors.amber : Color(0xff212020) ,
                 //   color: Color(0xff212020),
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
                  Container(
                    height: size.height*.056,
                    width: size.width*.13,
                    child: Image.asset(images[index].toString()))
                ]

              ),
                        );
                      },
                    ),
                  ),
                ),
              ),


              Container(
                height: MediaQuery.of(context).orientation==Orientation.portrait?
                size.height*.06:
                size.height*.08,
                width: MediaQuery.of(context).orientation==Orientation.portrait?
                size.width*.80:
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
                    onPressed: () async{
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (c, a1, a2) => Select_subscription(),
                      //     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                      //     transitionDuration: Duration(milliseconds: 100),
                      //   ),
                      // );
                      if(_key.currentState!.validate()){
                        await FirebaseFirestore.instance.collection('TeamSelected').doc().set({
                       'uid': _auth.currentUser!.uid.toString(),
                       'image': images[selectedCard],
                         'teamName': text[selectedCard],
                        }).then((value){

                        //  _idCardImages.clear();
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                          Fluttertoast.showToast(
                            msg: 'Category Added',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            //timeInSecForIosWeb: 10,
                          );
                        });

                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue'
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
      ),
    );
  }
}
