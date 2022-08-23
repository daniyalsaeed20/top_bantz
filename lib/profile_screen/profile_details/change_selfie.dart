import 'package:flutter/material.dart';
class Change_Selfie extends StatefulWidget {
  const Change_Selfie({Key? key}) : super(key: key);

  @override
  _Change_SelfieState createState() => _Change_SelfieState();
}

class _Change_SelfieState extends State<Change_Selfie> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(

                AssetImage("assets/images/icon/gallery.png"),color: Colors.white,
                size: 25,
                // color: Color(0xFF3A5A98),
              ),
              onPressed: () {},
            ),
           // SizedBox(width: 48.0),
            IconButton(
              icon:  ImageIcon(

                AssetImage("assets/images/icon/camera1.png"),
                size: 25,color: Colors.white,
                // color: Color(0xFF3A5A98),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon:  ImageIcon(

                AssetImage("assets/images/icon/refresh.png"),
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
              height: size.height*.93,
              width: size.width,
              child: Image.asset('assets/images/icon/person.png',fit: BoxFit.cover,))
        ],
      ),
     );
  }
}
