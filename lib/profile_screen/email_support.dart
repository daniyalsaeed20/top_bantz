import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Email_support extends StatefulWidget {
  const Email_support({Key? key}) : super(key: key);

  @override
  _Email_supportState createState() => _Email_supportState();
}

class _Email_supportState extends State<Email_support> {
  TextEditingController _email = TextEditingController();
  TextEditingController _messagedetails = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
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
        title: Text('Email Support'),
      ),
      body:  Form(
        key: _key,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff212020),
                  borderRadius: BorderRadius.circular(12)
                ),

                height: size.height*.06,
                width: size.width*.85,
                child: TextFormField(
                  style: TextStyle(color: Colors.grey,fontSize: 12),
controller: _email,
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10,left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ) ,


                      hintText: 'Email',hintStyle: TextStyle(fontSize: 12,color: Colors.grey,)
                  ),
                  validator: (String? values) {
                    if (values!.isEmpty) {
                      return ('Please Enter Email Address');
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff212020),
                    borderRadius: BorderRadius.circular(12)
                ),
                height: size.height*.16,
                width: size.width*.85,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12,color: Colors.grey,),
controller: _messagedetails,
                    decoration:  InputDecoration(
                       border: InputBorder.none,
                        hintText: 'Message',hintStyle: TextStyle(fontSize: 12,color: Colors.grey,)
                    ),
                    validator: (String? values) {
                      if (values!.isEmpty) {
                        return ('Please Enter message details');
                      }
                    },
                  ),
                ),
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
                          onPressed: () async {
                            if(_key.currentState!.validate()){
                              await FirebaseFirestore.instance.collection('email support data').doc().set(
                                  {
                                    'Title': _email.text,
                                    'message': _messagedetails.text
                                    //  'caseTitle': searchCaseByTitle(title),
                                    //'image': _idCardImages,

                                   // 'uid': _auth.currentUser!.uid.toString(),
                                  }
                              ).then((value){
                                _email.clear();
                                _messagedetails.clear();
                              //  _idCardImages.clear();
                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Admin()));
                                Fluttertoast.showToast(
                                  msg: 'Data Added succesfully',
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  //timeInSecForIosWeb: 10,
                                );
                              });

                            }

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Submit'
                                ,textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff1C3857),
                                    letterSpacing: .05,fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
