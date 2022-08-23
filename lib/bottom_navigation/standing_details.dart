import 'package:flutter/material.dart';
class Standing_details extends StatefulWidget {
  const Standing_details({Key? key}) : super(key: key);

  @override
  _Standing_detailsState createState() => _Standing_detailsState();
}

class _Standing_detailsState extends State<Standing_details> {
  List<RadioModel> sampleData = <RadioModel>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel('1','assets/images/leagues/barcelona.png','Atlético Madrid','2','1','6','33','32'));
    sampleData.add(new RadioModel('2','assets/images/leagues/Vector.png','Real Madrid','4','1','5','33','32'));
    sampleData.add(new RadioModel('3','assets/images/leagues/barcelona.png','Barcelona','4','3','6','33','32'));
    sampleData.add(new RadioModel('4','assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));
    sampleData.add(new RadioModel('5','assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));
    sampleData.add(new RadioModel('6','assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));
    sampleData.add(new RadioModel('7','assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));
    sampleData.add(new RadioModel('8','assets/images/leagues/barcelona.png','Villareal','8','3','4','33','32'));


  }
  List<String> text =['All','Home','Away'];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading:    IconButton(onPressed: (){
        Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 16,)),
        title: Row(
          children: [
            SizedBox(width: size.width*.2,),
            Container(
                height: size.height*.04,
                width: size.width*.04,
                child: Image.asset('assets/images/leagues/spain.png')),
            Text('Spain',style: TextStyle(fontSize: 15,color: Colors.white),)
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
                height: size.height*.16,
                width: size.width*.6,
                child: Image.asset('assets/images/leagues/LaLiga_Santander_logo.png',fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
                width: size.width*.85,
                child: Text('La Liga',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: size.height*.01,
            ),
        Container(
          width: size.width*.85,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(
                    minWidth:  MediaQuery.of(context).size.width * .1,

                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topCenter,
                    stops: [0.0, 1.0],
                    colors: [
                      Color(0xfff1e291),
                      Color(0xffe0b108),



                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child:Text('All',
                    // "${text[imdex].toString()}",
                    style:TextStyle(fontSize: 12,color: Colors.white)
                  // Theme.of(context).textTheme.
                  // body1.apply(
                  //   color: Colors.black87,
                  // ),
                )

              ),
              SizedBox(
                width: size.width*.03,
              ),
              Container(
                constraints: BoxConstraints(
                    minWidth:  MediaQuery.of(context).size.width * .1,

                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topCenter,
                    stops: [0.0, 1.0],
                    colors: [
                      Color(0xfff1e291),
                      Color(0xffe0b108),



                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child:Text('Home',
                    // "${text[imdex].toString()}",
                    style:TextStyle(fontSize: 12,color: Colors.white)
                  // Theme.of(context).textTheme.
                  // body1.apply(
                  //   color: Colors.black87,
                  // ),
                )

              ),
              SizedBox(
                width: size.width*.03,
              ),
              Container(
                constraints: BoxConstraints(
                    minWidth:  MediaQuery.of(context).size.width * .1,

                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),

                child:Text('Away',
                    // "${text[imdex].toString()}",
                    style:TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)
                  // Theme.of(context).textTheme.
                  // body1.apply(
                  //   color: Colors.black87,
                  // ),
                )

              ),
            ],
          ),
        ),
            SizedBox(
              height: size.height*.03,
            ),
            Container(
                height: size.height*.04,
                width: size.width*.85,
                //   alignment: Alignment.center,
                child:Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: size.width*.03,),
                        Container(
                            width: size.width*.07,
                            child: Text('#',style: TextStyle(fontSize: 15,color: Colors.white),)),

                        Container(
                            width: size.width*.314,
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
                    ),
                    SizedBox(
                      height: size.height*.01,
                    ),
                    Container(
                      height: size.height*.002,
                      width: size.width*.85,
                      color: Color(0xff2b2b3d),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height*.01,
            ),
            Container(
              height: size.height*.52,
              width: size.width*.85,
              child: ListView.builder(
                // shrinkWrap: true,
                  physics:   NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff212020),
                          borderRadius: BorderRadius.circular(12)
                        ),
                          height: size.height*.06,
                          width: size.width*.85,
                          child:Row(
                            children: [
                              Container(
                                width: size.width*.4,
                                child: Row(
                                  children: [
                                    Container(
                                        width: size.width*.05,
                                        alignment: Alignment.center,
                                        child: Text(sampleData[index].number,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),

                                    Container(
                                        width: size.width*.05,
                                        height: size.height*.03,
                                        child: Image.asset(sampleData[index].image)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: size.width*.27,
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
    );
  }
}
class RadioModel {
  final String number;
  final String image;
  final String teamname;

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  //final Color color1;

  RadioModel(
      this.number,
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