import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_bantz/bottom_navigation/battle_room.dart';
import 'package:top_bantz/bottom_navigation/chatroom.dart';
import 'package:top_bantz/models/ChatRoomModel.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/models/teamselected_model.dart';

import '../main.dart';
import '../profile_screen/SearchPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserCredential? credential;
  List<String> images = ['assets/images/icon/camera.png','assets/images/leagues/Vector.png','assets/images/leagues/barcelona.png',
    'assets/images/leagues/English_Football_League_Logo.png','assets/images/leagues/spain.png','assets/images/leagues/LaLiga_Santander_logo.png',
    'assets/images/leagues/UEFA_Champions_League_logo_2.png','assets/images/icon/camera.png','assets/images/leagues/Vector.png','assets/images/leagues/barcelona.png',
    'assets/images/leagues/English_Football_League_Logo.png','assets/images/leagues/spain.png','assets/images/leagues/LaLiga_Santander_logo.png',
    'assets/images/leagues/UEFA_Champions_League_logo_2.png'
  ];
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> text=['Premier League','LaLiga Santanders','UEFA Champions League','English Football League'];
  List<String> image=['assets/images/leagues/Premier_League_Logo.png','assets/images/leagues/LaLiga_Santander_logo.png',
    'assets/images/leagues/UEFA_Champions_League_logo_2.png','assets/images/leagues/English_Football_League_Logo.png'];




  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool? result = await _onBackPressed();
        if (result == null) {
          result = false;
        }
        return result;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
body: SingleChildScrollView(
  child:   Center(
      child:   Column(

        children: [

          SizedBox(
            height: size.height*.04,
          ),

          Container(
            height: size.height*.1,
            width: size.width,
            child: Row(
               children: [
                 SizedBox(
                   width: size.width*.05,
                 ),
                Image.asset('assets/images/splash_image.png'),
                 SizedBox(
                   width: size.width*.22,
                 ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25,color: Colors.white,)),
                    Stack(
                        children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,size: 25,color: Colors.white,)),
                          Positioned(
                            right: 10,
                            top: 12,
                            child: Container(
                              alignment: Alignment.center,
                                height: size.height*.016,
                                width: size.width*.034,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text('3',style: TextStyle(color: Colors.white,fontSize: 10),)),
                          )
                        ],
                    )
                  ],
                ),
                 Container(
                     alignment: Alignment.center,
                     height: size.height*.04,
                     width: size.width*.19,
                     decoration: BoxDecoration(
                         color: Color(0xffDFAE00
                         ),
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(20),
                          // topRight: Radius.circular(20),
                           bottomLeft: Radius.circular(20),
                           //bottomRight: Radius.circular(25),
                         )
                     ),
                     child:Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                             height: size.height*.03,
                             width: size.width*.06,
                           alignment:Alignment.center,
                             decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(20)
                             ),
                             child: Text('€',style: TextStyle(color: Color(0xffDFAE00),fontSize: 10),)),
                         Text('100',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                       ],
                     )


                  ),

              ],

            ),

          ),
          SizedBox(
            height: size.height*.024,
          ),

          Container(
            height: size.height*.18,
            width: size.width*.85,
            decoration: BoxDecoration(
                color: Color(0xffDFAE00),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                stops: [0.0, 1.0],
                colors: [
                  Color(0xff246BFD),
                  Color(0xff0C0C69),


                ],
              ),
                borderRadius: BorderRadius.circular(12),),
                //   topLeft: Radius.circular(20),
                //   // topRight: Radius.circular(20),
                //   bottomLeft: Radius.circular(20),
                //   //bottomRight: Radius.circular(25),
                // )
           // )
            child: Row(
              children: [
                SizedBox(
                  width: size.width*.02,
                ),
Container(
//  height: size.height*.09,
  width: size.width*.43,
  child: Column(
      children: [
        SizedBox(
          height: size.height*.01,
        ),
        Container(
          height: size.height*.035,
          width: size.width*.50,
          child: Row(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  height: size.height*.035,
                  width: size.width*.20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      //   topLeft: Radius.circular(20),
                      //   // topRight: Radius.circular(20),
                      //   bottomLeft: Radius.circular(20),
                      //   //bottomRight: Radius.circular(25),
                      // )
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                         height:size.height*.04,
                         width: size.width*.04,
                         child: Image.asset('assets/images/footbal.png')),
                      Text('Football',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                    ],
                  )


              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height*.01,
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: size.height*.09,
            width: size.width*.5,
            child: Text("Liverpool UEFA Champion League Celebration",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),)),
        Container(
            alignment: Alignment.centerLeft,
            height: size.height*.02,
            width: size.width*.5,
            child: Text("Yesterday, 06.30 PM",style: TextStyle(fontSize: 10,color: Color(0xffe5e5e5),fontWeight: FontWeight.w900),)),




      ],
  ),
),
                Container(
                    height: size.height*.18,
                    width: size.width*.40,
                    child: Image.asset('assets/images/footbal_cup_image.png',fit: BoxFit.cover,))
                
              ],
            ),
          ),
          SizedBox(
            height: size.height*.024,
          ),
          Container(
              height: size.height*.05,
              width: size.width*.85,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                    height: size.height*.05,
                    width: size.width*.40,
                    child: Text("Leagues",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)),
                Container(
                   alignment: Alignment.centerRight,
                    height: size.height*.05,
                    width: size.width*.40,
                    child: Text("See All",style: TextStyle(fontSize: 12,color: Color(0xfff1e08b),fontWeight: FontWeight.w900),)),
              ],
            )
          ),
          Container(
            height: size.height*.41,
            width: size.width*.90,
            color: Colors.black,
            child: ListView.builder(
              physics:NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: size.height*.08,
                      width: size.width*.80,
                      decoration: BoxDecoration(
                        color: Color(0xff212020),

                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                width: size.width*.1,
                                height: size.height*.06,
                                child: Image.asset(image[index],fit: BoxFit.cover,)),
                          ),
                          SizedBox(
                            width: size.width*.06,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              //height: size.height*.06,
                              width: size.width*.40,
                              child: Text(text[index].toString(),style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),)),
                          SizedBox(
                            width: size.width*.0886,
                          ),

                          Container(
                              alignment: Alignment.center,
                              height: size.height*.08,
                              width: size.width*.20,
                              decoration: BoxDecoration(
                                  color: Color(0xffDFAE00),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    stops: [0.0, 1.0],
                                    colors: [
                                      Color(0xffF1E291),
                                      Color(0xffDFAE00),


                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(

                                   // topLeft: Radius.circular(20),
                                     topRight: Radius.circular(20),
                                   // bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(25),
                                  )
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Container(
                                  //     height: size.height*.03,
                                  //     width: size.width*.06,
                                  //     alignment:Alignment.center,
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.black,
                                  //         borderRadius: BorderRadius.circular(20)
                                  //     ),
                                  //     child: Text('€',style: TextStyle(color: Color(0xffDFAE00),fontSize: 10),)),
                                  //
                                  Text('Join',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                                ],
                              )


                          ),
                        ],

                      ),
                    ),
                  );
                }

            ),
          ),
          SizedBox(
            height: size.height*.018,
          ),
          Container(
              height: size.height*.05,
              width: size.width*.85,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.05,
                      width: size.width*.40,
                      child: Text("Battle Room",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)),
                  Container(
                      alignment: Alignment.centerRight,
                      height: size.height*.05,
                      width: size.width*.40,
                      child: Text("See All",style: TextStyle(fontSize: 12,color: Color(0xfff1e08b),fontWeight: FontWeight.w900),)),
                ],
              )
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => BattleRoom(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 100),
                ),
              );
            },
            child: Container(
              height: size.height*.23,
              width: size.width*.90,
              color: Colors.black,
              child: ListView.builder(
                  physics:NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: size.height*.08,
                        width: size.width*.80,
                        decoration: BoxDecoration(
                            color: Color(0xff212020),

                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: size.height*.03,
                                width: size.width*.20,
                                decoration: BoxDecoration(
                                    color: Color(0xffDB0030),

                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Text('Join',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                                  ],
                                )


                            ),
                            Container(
                                width: size.width*.1,
                                height: size.height*.06,
                                child: Image.asset(image[index],fit: BoxFit.cover,)),
                            // SizedBox(
                            //   width: size.width*.06,
                            // ),
                            Container(
                                alignment: Alignment.centerLeft,
                                //height: size.height*.06,
                                width: size.width*.10,
                                child: Text('VS',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)),

                            Container(
                                width: size.width*.1,
                                height: size.height*.06,
                                child: Image.asset(image[index],fit: BoxFit.cover,)),
                            Container(
                                alignment: Alignment.center,
                                height: size.height*.03,
                                width: size.width*.20,
                                decoration: BoxDecoration(
                                    color: Colors.blue,

                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Text('Join',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                                  ],
                                )


                            ),


                          ],

                        ),
                      ),
                    );
                  }

              ),
            ),
          ),
          SizedBox(
            height: size.height*.01,
          ),
          Container(
              height: size.height*.05,
              width: size.width*.85,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.05,
                      width: size.width*.40,
                      child: Text("Lobbies",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)),
                   ],
              )
          ),
          SizedBox(
            width: size.width,
              height: size.height*0.32,
            child:  StreamBuilder<List<TeamSelected>>(
              stream: FirebaseFirestore.instance.collection('TeamSelected')
                //  .where("uid", isEqualTo: _auth.currentUser!.uid)
                  .snapshots()
                  .map((event) => event.docs
                  .map((e) => TeamSelected(

                uid: e.get("uid"),
                text: e.get('teamName'),
                images: e.get('image'),

              ))
                  .toList()),
              builder: (context, snapshot) {

                if(snapshot.hasData){

                  return GridView.builder(
                    //shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    //snapshot.data!.docs.length,
                    //images.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:   4,
                        //mainAxisSpacing: 2
                        mainAxisExtent: 65,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10

                    ),
                    itemBuilder: (BuildContext context, int index) {

                      TeamSelected teamSelected = snapshot.data![index];
                      log('uid' +teamSelected.uid.toString());
                      return GestureDetector(
                        onTap: () async{

                         UserModel? userdata = await FirebaseHelper.getUserModelById(teamSelected.uid.toString());
                         log('userdata' +userdata!.uid.toString());
                          ChatRoomModel? chatroomModel = await getChatroomModel(userdata);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => ChattingScreen(chatroom: chatroomModel),
                              transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 100),
                            ),
                          );
                        },
                        child: Stack(
                            alignment: Alignment.center,
                            children:[
                              Container(
                                height: size.height*.075,
                                width: size.width*.19,

                                decoration: BoxDecoration(

                                    color: Color(0xff212020),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                              Container(
                                  height: size.height*.056,
                                  width: size.width*.13,
                                  child: Image.asset(teamSelected.images.toString() ))
                            ]

                        ),
                      );
                    },
                  );
                }     else {return Container(
                  child: CircularProgressIndicator(),
                );}

              }
            ),
          ),
        ],

      ),
  ),
),
      ),
    );
  }
  Future<bool?> _onBackPressed() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
                child: const Text(
                  "Warning!",
                  style: TextStyle(color: Colors.red),
                )),
            content: const Text(
              "Are you sure you want to Exit",
              style: const TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
            ],
          );
        });
  }
  Future<ChatRoomModel?> getChatroomModel(UserModel targetUser) async {
    User? user=_auth.currentUser;
    ChatRoomModel? chatRoom;

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("chatrooms").where("participants.${user!.uid}",
        isEqualTo: true).where("participants.${targetUser.uid}", isEqualTo: true).get();

    if(snapshot.docs.length > 0) {
      // Fetch the existing one
      var docData = snapshot.docs[0].data();
      ChatRoomModel existingChatroom = ChatRoomModel.fromMap(docData as Map<String, dynamic>);

      chatRoom = existingChatroom;
    }
    else {
      // Create a new one
      ChatRoomModel newChatroom = ChatRoomModel(
        chatroomid: uuid.v1(),
        lastMessage: "",
        participants: {
          user.uid.toString(): true,
          targetUser.uid.toString(): true,
        },
      );

      await FirebaseFirestore.instance.collection("chatrooms").doc(newChatroom.chatroomid).set(newChatroom.toMap());

      chatRoom = newChatroom;

      log("New Chatroom Created!");
    }

    return chatRoom;
  }

}
