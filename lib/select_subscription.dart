import 'package:flutter/material.dart';
import 'package:top_bantz/select_avatar.dart';
class Select_subscription extends StatefulWidget {
  const Select_subscription({Key? key}) : super(key: key);

  @override
  _Select_subscriptionState createState() => _Select_subscriptionState();
}

class _Select_subscriptionState extends State<Select_subscription> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height*.07,
            ),
            Container(
              //  alignment: Alignment.centerLeft,
              height: size.height*.09,
              width: size.width*.85,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.55,
                      child: Text("Select Subscription",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),
                ],
              ),
            ),
            SizedBox(
              height: size.height*.07,
            ),
            Container(
              height: size.height*.18,
              width: size.width*.80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height*.01,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.05,
                      width: size.width*.70,
                      child: Text("Free",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),

                  SizedBox(
                    height: size.height*.01,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.70,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        style: TextStyle(fontSize: 12,color: Color(0xff65656B),fontWeight: FontWeight.w500),)),

                ],
              ),
            ),
            SizedBox(
              height: size.height*.07,
            ),
            Container(
              height: size.height*.18,
              width: size.width*.80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height*.01,
                  ),
                  Container(
                    height: size.height*.05,
                    width: size.width*.70,
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: size.height*.05,
                            width: size.width*.40,
                            child: Text("Premium",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),
                        Container(
                            alignment: Alignment.centerLeft,
                            height: size.height*.05,
                            width: size.width*.25,
                            child: Text("£20 / mo",style: TextStyle(fontSize: 15,color: Colors.amber,fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: size.height*.01,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.70,
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        style: TextStyle(fontSize: 12,color: Color(0xff65656B),fontWeight: FontWeight.w500),)),

                ],
              ),
            ),
            SizedBox(
              height: size.height*.2,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => SelectAvatar(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
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
    );
  }
}
