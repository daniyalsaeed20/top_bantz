import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff212020),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios),),
        title: Text('Payment method'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height*.02,
            ),
            Container(

              width: size.width*.85,

              height: size.height*.03,

              alignment: Alignment.centerLeft,

              child: Text('Card information',

                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,

                  color: Colors.grey,),maxLines: 2,textAlign: TextAlign.end,

              ),

            ),
            Container(

              height: size.height*.06,
              width: size.width*.85,
color: Color(0xff212020),
              child: TextField(

                decoration:  InputDecoration(
                    suffixIcon: Container(
                      width: 90,
                      child: Row(
                          children: [
                            Image.asset('assets/images/icon/paypal.png'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 20,
                                  child: Image.asset('assets/images/icon/visa.png')),
                            ),

                ])),
                  //   prefixIcon:Icon(Icons.email_outlined,color: Color(0xff65656b),),
                  //  border: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ) ,


                    hintText: 'Card Number',hintStyle: TextStyle(fontSize: 12,color: Colors.grey,)
                ),
              ),
            ),
            SizedBox(
              height: size.height*.02,
            ),
            Container(
                height: size.height*.06,
                width: size.width*.85,

            child:  Row(
                children: [
                  Container(
                    color: Color(0xff212020),
                    height: size.height*.06,
                    width: size.width*.42,
                    child: TextField(

                      decoration:  InputDecoration(
                        //   prefixIcon:Icon(Icons.email_outlined,color: Color(0xff65656b),),
                        //  border: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ) ,


                          hintText: 'mm/yy',hintStyle: TextStyle(fontSize: 12,color: Colors.grey,)
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width*.01,
                  ),
                  Container(
                    color: Color(0xff212020),
                    height: size.height*.06,
                    width: size.width*.42,

                    child: TextField(

                      decoration:  InputDecoration(
                        //   prefixIcon:Icon(Icons.email_outlined,color: Color(0xff65656b),),
                        //  border: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ) ,


                          hintText: 'CVV',hintStyle: TextStyle(fontSize: 12,color: Colors.grey,)
                      ),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(
              height: size.height*.06,
            ),
            Container(
              width: size.width,
              height: size.height*.06,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            Text('Pay \$ 320.10'
                              ,textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff1C3857),
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
          ],
        ),
      ),
    );
  }
}
