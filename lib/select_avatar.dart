import 'package:flutter/material.dart';
import 'package:top_bantz/bottom_navigation/app_bootom_navigation_bar.dart';
import 'package:top_bantz/profile_screen/profile.dart';
class SelectAvatar extends StatefulWidget {
  const SelectAvatar({Key? key}) : super(key: key);

  @override
  _SelectAvatarState createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  List <Color>  color =[Color(0xffFDF7EA),Color(0xffF3EAD6),Color(0xffF6E7C7),Color(0xffF4D79C),Color(0xffEBC985),
    Color(0xffD0AB5F), Color(0xffAB7F25),Color(0xff7B5A17),Color(0xff553D0D)];
  List<String> text=['face','eyes','Hairs','Cloths'];
  List<bool> _hasBeenPressed = [true, false, false, false];
  List<String> text1=['Color','Mouth','Nose','Ears'];
  String selected = "";
  String answer = "face";
  int? tappedIndex;
  int? tappedIndex1;
  int? tappedIndex2;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
    tappedIndex1 = 0;
    tappedIndex2 = 0;
  }
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
                      child: Text("Select Your Avatar",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),
                ],
              ),
            ),


            SizedBox(
              height: size.height*.04,
            ),
            Container(
              height: size.height*.07,
              width: size.width*.90,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
setState(() {
tappedIndex=index;
});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      height: size.height*.06,
                      width: size.width*.18,
                      decoration: BoxDecoration(
                          color: tappedIndex == index ? Color(0xffFBAD17) : Color(0xff212020),
                        borderRadius: BorderRadius.circular(10)
                      ),
                     child: Text(text[index].toString(),style: TextStyle(color: tappedIndex == index ? Colors.white : Color(0xff3c3b41),
                         fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
              height: size.height*.07,
              width: size.width*.90,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,int index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      tappedIndex1  =index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
alignment: Alignment.center,
                      height: size.height*.05,
                      width: size.width*.18,
                      decoration: BoxDecoration(
                          color: tappedIndex1 == index ? Color(0xffFBAD17) : Color(0xff212020),
                        borderRadius: BorderRadius.circular(10)
                      ),
                     child: Text(text1[index].toString(),style: TextStyle( color: tappedIndex1 == index ? Colors.white : Color(0xff3c3b41),
                         fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
              }),
            ),
            Container(
              height: 40,
              width: 320,
              child:   ListView.builder(
                  itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,int index){return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 40,
                      width: 30,
                      decoration: BoxDecoration(
                          color: color[index],
                          shape: BoxShape.circle
                      ),

                    ),
                  );}),
            ),
            SizedBox(
              height: size.height*.04,
            ),
            Container(
                width: size.width,
                height: size.height*.39,
                //   color: Colors.red,
                child: Image.asset('assets/images/profile_image.png')),
            SizedBox(
              height: size.height*.04,
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
                        pageBuilder: (c, a1, a2) => AppBottomNavigationBar(),
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
