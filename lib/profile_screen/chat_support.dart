import 'package:flutter/material.dart';
class Chat_support extends StatefulWidget {
  const Chat_support({Key? key}) : super(key: key);

  @override
  _Chat_supportState createState() => _Chat_supportState();
}

class _Chat_supportState extends State<Chat_support> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(






      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: size.height*.04,
              // ),
              Container(
                height: size.height*.14,
                width: size.width,
                child: Stack(
                    children: [
                      Container(
                        height: size.height*.12,
                        width: size.width,
                        color: Color(0xff212020),
                        child: Column(

                          children: [
                            SizedBox(
                              height: size.height*.04,
                            ),
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      width: size.width*.06,
                                      child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {Navigator.pop(context);  },)),
                                ),
                                SizedBox(
                                  width: size.width*.19,
                                ),

                                Container(
                                    width: size.width*.5,
                                    child: Text('Chat Support ',style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: size.height*.045,
                          width: size.width*.24,
                          decoration: BoxDecoration(
                              color: Color(0xffdba111),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)
                              )
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 9,
                              ),
                              Container(
                                height: size.height*.039,
                                width: size.width*.09,
                                decoration: BoxDecoration(
                                    color: Color(0xffffd246),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: size.height*.03,
                                        width: size.width*.09,
                                        child: Text('AD')),
                                    Container(

                                      alignment: Alignment.center,
                                      height: size.height*.008,
                                      width: size.width*.09,
                                      color: Color(0xffccf5ff),
                                      child: Text('‐',style: TextStyle(fontSize: 12,color: Colors.black),),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                height: size.height*.039,
                                width: size.width*.09,
                                child:
                                Text('View Ads',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),)
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              ),
              SizedBox(
                height: size.height*.28,
              ),
              Container(
                height:MediaQuery.of(context).orientation==Orientation.portrait?
                size.height*.50:
                size.height*.50,
                width: size.width*.90,
                child: ListView.builder(
                    itemCount:1,
                    itemBuilder: (context,int index)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child:Column(
                              children: [
                                Container(
                                  width:size.width*.90,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:BorderRadius.circular(12),
                                            child: Container(
                                                height:size.height*.05,
                                                width: size.width*.1,
                                                child: Image.asset('assets/images/image.png')),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),

                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width * .6),
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                //   bottomLeft: Radius.circular(25),
                                                bottomRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Text('gfg,dsjxsh hsdgs',
                                                // "${messages[i]['message']}",
                                                style:TextStyle(fontSize: 12,color: Colors.white)
                                              // Theme.of(context).textTheme.
                                              // body1.apply(
                                              //   color: Colors.black87,
                                              // ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),


                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Container(
                                          height:size.height*.12,
                                          width: size.width*.5,
                                          child: Image.asset('assets/images/Rectangle.png')),
                                      Container(
                                        width: size.width*.5,
                                        alignment: Alignment.centerRight,
                                        child: Text('08:43 AM',
                                          //"${messages[i]['time']}",
                                          style: TextStyle(fontSize: 12,color: Color(0xff938a9a)),
                                          // style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: size.height*.05,
                                ),
                                Container(
                                  width:size.width*.90,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          // Text('08:43 AM',
                                          //   //"${messages[i]['time']}",
                                          //   style: TextStyle(fontSize: 12,color: Color(0xff938a9a)),
                                          //   // style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
                                          // ),
                                          SizedBox(
                                            width: size.width*.30,
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width * .6),
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                                //bottomRight: Radius.circular(25),
                                              ),
                                            ),
                                            child: Text('gfg,dsjxsh hsdgs xchsxzhdcjh ',
                                                // "${messages[i]['message']}",
                                                style:TextStyle(fontSize: 12,color: Colors.white)
                                              // Theme.of(context).textTheme.
                                              // body1.apply(
                                              //   color: Colors.black87,
                                              // ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width*.3,
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width * .6),
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                                //bottomRight: Radius.circular(25),
                                              ),
                                            ),
                                            child: Text('gfg,dsjxsh hsdgs xchsxzhdcjh ',
                                                // "${messages[i]['message']}",
                                                style:TextStyle(fontSize: 12,color: Colors.white)
                                              // Theme.of(context).textTheme.
                                              // body1.apply(
                                              //   color: Colors.black87,
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )


                        ),
                      );
                    }
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Color(0xff7a7979),
              //     borderRadius: BorderRadius.circular(12)
              //   ),
              //   height: size.height*.06,
              //   width: size.width*.90,
              //   child: Row(
              //     children: [
              //
              //
              //
              //   ],
              //   ),
              // )
              Container(

                height: size.height*.06,
                width: size.width*.85,
                decoration: BoxDecoration(
                    color: Color(0xff212020),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: TextField(

                  decoration:  InputDecoration(
                      prefixIcon:Icon(Icons.emoji_emotions_outlined,color: Color(0xff65656b),),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: Icon(Icons.camera_alt,color: Color(0xff65656b),), onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.mic,color: Color(0xff65656b),), onPressed: (){}),
                        ],
                      ),
                      //Icon(Icons.camera_alt,color: Color(0xff65656b),),
                      //   suffix: Icon(Icons.emoji_emotions_outlined,color: Color(0xff65656b),),
                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(9),
                      // ) ,


                      hintText: 'Type Message here...',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
