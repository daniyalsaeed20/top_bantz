import 'package:flutter/material.dart';
import 'package:top_bantz/bottom_navigation/standing_details.dart';
class Standing extends StatefulWidget {
  const Standing({Key? key}) : super(key: key);

  @override
  _StandingState createState() => _StandingState();
}

class _StandingState extends State<Standing> {
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel('assets/images/leagues/barcelona.png','Atlético Madrid','2','1','6','33','32'));
    sampleData.add(new RadioModel('assets/images/leagues/Vector.png','Real Madrid','4','1','5','33','32'));
    sampleData.add(new RadioModel('assets/images/leagues/barcelona.png','Barcelona','4','3','6','33','32'));
    sampleData.add(new RadioModel('assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));


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
              height: size.height*.06,
              width: size.width*.85,
              decoration: BoxDecoration(
                  color: Color(0xff212020),
                  borderRadius: BorderRadius.circular(12)
              ),

              child: TextField(
                decoration:  InputDecoration(
                    prefixIcon:Icon(Icons.search,color: Color(0xff65656b),),

                    border: InputBorder.none,
                    hintText: 'Search Your Competition...',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)

                ),

              ),

            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
              height: size.height*.06,
              width: size.width*.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
Container(
    height:size.height*.03,
    width: size.width*.1,
    child: Image.asset('assets/images/leagues/barcelona.png')),
                  Container(
                    width: size.width*.60,
                    alignment: Alignment.centerLeft,
                    child: Column(

                      children: [
                        SizedBox(
                          height: size.height*.008,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text('La Liga',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                        Container(
                            alignment: Alignment.centerLeft,child: Text('Spain',style: TextStyle(fontSize: 12,color: Color(0xffaaaaaa)),)),
                      ]
                    ),
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => Standing_details(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,))
                ],
              ),
            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
              height: size.height*.27,
              width: size.width*.85,
              decoration: BoxDecoration(
                  color: Color(0xff212020),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      height: size.height*.04,
                      width: size.width*.85,
                   //   alignment: Alignment.center,
                      child:Row(
                    children: [
                      SizedBox(width: size.width*.03,),
                      Container(
                          width: size.width*.38,
                          child: Text('Team',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      Container(
                          width: size.width*.08,
                          child: Text('D',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      Container(
                          width: size.width*.08,
                          child: Text('L',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      Container(
                          width: size.width*.08,
                          child: Text('Ga',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      Container(
                          width: size.width*.08,
                          child: Text('Gd',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      Container(
                          width: size.width*.08,
                          child: Text('pts',style: TextStyle(fontSize: 15,color: Colors.white),)),
                    ],
                  )),
                  Container(
                    height: size.height*.22,
                    width: size.width*.85,
                    child: ListView.builder(
                     // shrinkWrap: true,
                        physics:   NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: size.height*.03,
                                width: size.width*.85,
                                child:Row(
                                  children: [
                                    Container(
                                      width: size.width*.4,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: size.width*.1,
                                              child: Image.asset(sampleData[index].image)),
                                          Container(
                                              width: size.width*.3,
                                              child: Text(sampleData[index].teamname,style: TextStyle(fontSize: 12,
                                                  color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text1,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text2,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text3,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text4,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text5,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                  ],
                                )

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),



            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
              height: size.height*.06,
              width: size.width*.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height:size.height*.03,
                      width: size.width*.1,
                      child: Image.asset('assets/images/leagues/barcelona.png')),
                  Container(
                    width: size.width*.60,
                    alignment: Alignment.centerLeft,
                    child: Column(

                      children: [
                        SizedBox(
                          height: size.height*.008,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Premier League ',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                        Container(
                            alignment: Alignment.centerLeft,child: Text('England',style: TextStyle(fontSize: 12,color: Color(0xffaaaaaa)),)),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,))
                ],
              ),
            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
              height: size.height*.27,
              width: size.width*.85,
              decoration: BoxDecoration(
                  color: Color(0xff212020),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      height: size.height*.04,
                      width: size.width*.85,
                      //   alignment: Alignment.center,
                      child:Row(
                        children: [
                          SizedBox(width: size.width*.03,),
                          Container(
                              width: size.width*.38,
                              child: Text('Team',style: TextStyle(fontSize: 15,color: Colors.white),)),
                          Container(
                              width: size.width*.08,
                              child: Text('D',style: TextStyle(fontSize: 15,color: Colors.white),)),
                          Container(
                              width: size.width*.08,
                              child: Text('L',style: TextStyle(fontSize: 15,color: Colors.white),)),
                          Container(
                              width: size.width*.08,
                              child: Text('Ga',style: TextStyle(fontSize: 15,color: Colors.white),)),
                          Container(
                              width: size.width*.08,
                              child: Text('Gd',style: TextStyle(fontSize: 15,color: Colors.white),)),
                          Container(
                              width: size.width*.08,
                              child: Text('pts',style: TextStyle(fontSize: 15,color: Colors.white),)),
                        ],
                      )),
                  Container(
                    height: size.height*.22,
                    width: size.width*.85,
                    child: ListView.builder(
                      // shrinkWrap: true,
                        physics:   NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: size.height*.03,
                                width: size.width*.85,
                                child:Row(
                                  children: [
                                    Container(
                                      width: size.width*.4,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: size.width*.1,
                                              child: Image.asset(sampleData[index].image)),
                                          Container(
                                              width: size.width*.3,
                                              child: Text(sampleData[index].teamname,style: TextStyle(fontSize: 12,
                                                  color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text1,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text2,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text3,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text4,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                    Container(
                                        width: size.width*.08,
                                        child: Text(sampleData[index].text5,style: TextStyle(fontSize: 15,color: Colors.white),)),
                                  ],
                                )

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),



            ),
          ],
        ),
      ),
    );
  }
}
class RadioModel {

  final String image;
  final String teamname;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  //final Color color1;

  RadioModel(
      this.image,
      this.teamname,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      //this.color1
      );
}