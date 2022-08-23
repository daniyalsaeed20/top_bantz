import 'package:flutter/material.dart';
class Article_details extends StatefulWidget {
  const Article_details({Key? key}) : super(key: key);

  @override
  _Article_detailsState createState() => _Article_detailsState();
}

class _Article_detailsState extends State<Article_details> {
  bool isReadmore = false ;
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
          Stack(

                      children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                            child: Image.asset('assets/images/leagues/player.png')),
                      ),
                        Positioned(
                            top: 30,
                            left: 15,
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white.withOpacity(0.8),) )),
                        Positioned(
                            right: 15,
                            top: 35,
                            child: Container(
                                height: size.height*.06,
                                width: size.width*.10,
                                child: Image.asset('assets/images/icon/share.png'))),
                        Positioned(
                            right: 15,
                            top: 100,
                            child: Container(
                                height: size.height*.06,
                                width: size.width*.10,
                                child: Image.asset('assets/images/icon/save.png'))),

            ]
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height*.09,
                        width: size.width*.90,
                        child: Text("Arsenal vs Aston Villa prediction",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),

                    Container(
                      width: size.width*.90,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/icon/person.png"),
                            radius: 20,
                          ),
                          SizedBox(
                            width: size.width*.08,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text('Brian Imanuel',style: TextStyle(fontSize: 12,color: Colors.white),),
                                Text('May 15, 2020',style: TextStyle(fontSize: 12,color: Colors.white),),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width*.08,
                          ),
                          Container(
                            child: Row(
                              children: [
                               Icon(Icons.favorite_border,color: Colors.white.withOpacity(.8),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('1403',style: TextStyle(fontSize: 12,color: Colors.white),),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.asset('assets/images/icon/Chat2.png',),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('1403',style: TextStyle(fontSize: 12,color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

            SizedBox(
            height: size.height*.02,
            ),
              SizedBox(
                height: size.height*.3,
                width: size.width*.90,
                child: ListView(
                  children: [
                    Text('A',style: TextStyle(fontSize: 30,color: Colors.white),),
                    //text widget to display long text
                    buildText("rsenal will have to grind it out against Aston Villa if they are to register \n\n League"
    'wins. The match is scheduled for Sunday at the Emirates.'
    'The Gunners put forth a real statement of intent after their 1-0 win against Manchester United. Mikel '
   ' Arteta\'s side had already surrendered points to Liverpool, Manchester City and ',),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      height: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.height*.055:
                      size.height*.08,
                      width: MediaQuery.of(context).orientation==Orientation.portrait?
                      size.width*.02:
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

                            setState(() {
                              // toggle the bool variable true or false
                              isReadmore = !isReadmore;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text((isReadmore?'Read Less' : 'Read More')
                                    ,textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .05,
                                        fontSize: 15
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                              //   Icon(Icons.arrow_forward)
                            ],
                          )

                      ),),

                  ],
                ),
              )
            ],
          ),
        )

    );
  }
  Widget buildText(String text){

    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: TextStyle(fontSize: 15,color: Colors.white,height: 2),
      maxLines: lines,

      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible: TextOverflow.ellipsis,
    );
  }
}
