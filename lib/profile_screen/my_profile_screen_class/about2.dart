import 'package:flutter/material.dart';

class About2 extends StatefulWidget {
  const About2({Key? key}) : super(key: key);

  @override
  _About2State createState() => _About2State();
}

class _About2State extends State<About2> {
  List<String> setimage = [
    'assets/images/icon/Vector.png',
    'assets/images/icon/email.png',
    'assets/images/icon/chat.png',
    'assets/images/icon/donate.png'
  ];

  List<String> name = ['name', 'Email', 'Phone', 'Adress'];
  List<String> email = ['Shahid', 'shahid@gmail.com', '034354874756', 'karak'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      width: size.width * .85,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: size.height * .08,
                width: size.width * .90,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //     height:size.height*.02,
                    //     width: size.width*.1,
                    //     child: Image.asset(setimage[index],color: Colors.white,)),
                    Container(
                      width: size.width * .69,
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        SizedBox(
                          height: size.height * .011,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Joined Battle Room',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: size.width * .69,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Joined Battle room  FC Barcelona vs Arsenal F.C',
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffaaaaaa)),
                            )),
                      ]),
                    ),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          // context,
                          // PageRouteBuilder(
                          // pageBuilder: (c, a1, a2) => Standing_details(),
                          // transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                          // transitionDuration: Duration(milliseconds: 100),
                          // ),
                          // );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}