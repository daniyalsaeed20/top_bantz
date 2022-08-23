import 'package:flutter/material.dart';
class Change_hair_style extends StatefulWidget {
  const Change_hair_style({Key? key}) : super(key: key);

  @override
  _Change_hair_styleState createState() => _Change_hair_styleState();
}

class _Change_hair_styleState extends State<Change_hair_style> {
  List <Color>  color =[Color(0xffFDF7EA),Color(0xffF3EAD6),Color(0xffF6E7C7),Color(0xffF4D79C),Color(0xffEBC985),
    Color(0xffD0AB5F), Color(0xffAB7F25),Color(0xff7B5A17),Color(0xff553D0D)];
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
        backgroundColor: Color(0xff212020),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  children: [
                    SizedBox(
                      height: size.height*.05,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: size.width,
                            height: size.height*.39,
                            //   color: Colors.red,
                            child: Image.asset('assets/images/profile_image.png')),
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
                      height: size.height*.51,
                      width: size.width,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width*.85,
                              child: Text('Choose Hairstlye',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(

                              width: size.width*.85,
                              child: Text('Shirts',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Container(
                              height: size.height*.09,
                              width: size.width*.90,
                              child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,int index){
                                    return  GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          tappedIndex=index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: size.height*.09,
                                                width: size.width*.18,
                                                decoration: BoxDecoration(
                                                    color: tappedIndex == index ? Color(0xffFBAD17) : Color(0xff212020),
                                                    borderRadius: BorderRadius.circular(5)
                                                ),

                                              ),
                                              Container(
                                                  height: 30,
                                                  child: Image.asset('assets/images/icon/hair.png'))
                                            ]
                                        ),
                                      ),
                                    );
                                  })
                          ),
                          Container(

                            width: size.width*.85,
                            child: Text('Shorts',style: TextStyle(color: Colors.white),),
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
                            height: size.height*.15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
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
                                borderRadius: BorderRadius.circular(30),
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
                                            fontSize: 15,fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      //   Icon(Icons.arrow_forward)
                                    ],
                                  )

                              ),),
                          ),
                        ],
                      ),
                    ),


                  ])
          ),
        )
    );
  }
}
