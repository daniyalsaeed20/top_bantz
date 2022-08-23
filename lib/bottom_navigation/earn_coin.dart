import 'package:flutter/material.dart';
class Earn_Coin extends StatefulWidget {
  const Earn_Coin({Key? key}) : super(key: key);

  @override
  _Earn_CoinState createState() => _Earn_CoinState();
}

class _Earn_CoinState extends State<Earn_Coin> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
appBar: AppBar(
  backgroundColor: Colors.black,
  leading: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },),
  ),
),
      body: Center(
        child: Column(
          children: [

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      height: size.height*.75,
                      width: size.width*.85,
                      child:  Image.asset('assets/images/download.jpg',fit: BoxFit.cover,)
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 30,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.50,
                      child: Text("Live Free Drive Smart",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),)),
                ),
                Positioned(
                  top: 50,
                  left: 30,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.50,
                      child: Text("The First Ever Hyndai Kona",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)),
                ),
                Positioned(
                  //top: 50,
                  left: 30,
                  bottom: 20,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: size.height*.09,
                      width: size.width*.70,
                      child: Text(" Lorem ipsum may be used as a placeholder before final copy is available.",
                        style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w900),)),
                ),
              ],

            )
          ],
        ),
      ),
    );
  }
}

