import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:top_bantz/admin/adminHome/admin_Screen.dart';
import 'package:top_bantz/bottom_navigation/home_page.dart';
import 'package:top_bantz/create-account/registration%20screen.dart';
import 'package:top_bantz/models/methods.dart';
import '../bottom_navigation/app_bootom_navigation_bar.dart';
import '../models/UserModel.dart';
import '../models/sharedPrefrences.dart';
import '../profile_screen/profile_details/change_hair_style.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage;
  final _auth = FirebaseAuth.instance;
  String Admin ='admin@gmail.com';
  String password ='Asd123qwe@';
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  MethodsHandler _methodsHandler = MethodsHandler();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _passwordVisible = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;

    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height*.1,
                ),
                Container(
                    width: size.width,
                    height: size.height*.39,
                    child: Image.asset('assets/images/image.png')),
                Container(
                  width: size.width,
                  height: size.height*.50,
                  decoration: BoxDecoration(
                    color: Color(0xff212020),
                    borderRadius: BorderRadius.circular(30)
                  ),
                 child: Container(
                 child: Column(
                   children: [
                     SizedBox(
                       height: size.height*.03,
                     ),
                     Container(
                       color: Colors.black,
                       height: size.height*.005,
                       width: size.width*.30,
                     ),
                     SizedBox(
                       height: size.height*.03,
                     ),
                     Container(
                         alignment: Alignment.centerLeft,
                         height: size.height*.06,
                         width: size.width*.80,
                         child: Text("Welcome",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),

                     SizedBox(
                       height: size.height*.02,
                     ),
                     Container(

                       height: size.height*.06,
                       width: size.width*.85,
                       decoration: BoxDecoration(
                           color: Colors.black,
                           borderRadius: BorderRadius.circular(12)
                       ),
                       child: TextFormField(

                         style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
                                  controller: _email,
                         decoration:  const InputDecoration(
                           contentPadding: const EdgeInsets.only(top: 15.0),
                             prefixIcon:Icon(Icons.email_outlined,color: Color(0xff65656b),size: 16,),
                             border: InputBorder.none,
                             hintText: 'Email',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),

                         )

                         ),
                         validator: (value) {
                           //EmailValidator.validate(value!);
                           if (!EmailValidator.validate(
                               _email.text)) {
                             return 'Please provide valid email';
                           }
                           return null;
                         },
                       ),
                     ),
                     SizedBox(
                       height: size.height*.02,
                     ),

                     Container(

                  //    padding: EdgeInsets.symmetric(vertical: 0.5,horizontal: 10),
                      height: size.height*.06,
                       width: size.width*.85,
                       decoration: BoxDecoration(
                         //  color: Colors.white,
                         color: Colors.black,
                           borderRadius: BorderRadius.circular(12)
                       ),
                       child: TextFormField(
                         textAlignVertical: TextAlignVertical.center,

                         style: TextStyle(fontSize:12,color: Color(0xff65656b)),
                      controller: _password,
                         obscureText: _obscureText,
                         decoration:  InputDecoration(


                             contentPadding: const EdgeInsets.only(top: 1.0),
                             prefixIcon:Icon(Icons.vpn_key,color: Color(0xff65656b),size: 16,),
                             suffixIcon: GestureDetector(
                                 onTap: (){
                                   _toggle();
                                 },
                                 child: Icon(Icons.visibility_off,color: Color(0xff65656b),size: 16,)),
                             border: InputBorder.none,
                            //labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),),
                            hintText: 'Password',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),

                         )

                         ),



                         validator: (PassCurrentValue){

                           RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                           var passNonNullValue=PassCurrentValue??"";
                           if(passNonNullValue.isEmpty){
                             return ("Password is required");
                           }
                           else if(passNonNullValue.length<6){
                             return ("Password Must be more than 5 characters");
                           }
                           else if(!regex.hasMatch(passNonNullValue)){
                             return ("Password should contain upper,lower,digit and Special character ");
                           }
                           return null;
                         },
                       ),
                     ),
                     SizedBox(
                       height: size.height*.03,
                     ),
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

                            // checkValues();
//
                           print(_email.text.toString());
if(Admin == _email.text && password == _password.text){
  print("Admin");

  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => AdminScreen()));
}
else {
  log('streamlogin');
  login(_email.text, _password.text);
}


                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Continue'
                                 ,textAlign: TextAlign.center,
                                 style: TextStyle(
                                     color: Colors.black,
                                     letterSpacing: .05,
                                     fontSize: 15
                                 ),
                               ),
                               //   Icon(Icons.arrow_forward)
                             ],
                           )

                       ),),
                     SizedBox(
                         height:size.height*.03
                     ),
                     Container(
                       height: size.height*.07,
                       width: size.width*.80,
                       // decoration: BoxDecoration(
                       //   // color: Color(0xffe1f5fe),
                       //    // borderRadius: BorderRadius.circular(25),
                       //   //  border: Border.all(width: 0.0, color: Colors.grey)
                       //   ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           Text('Don’t have account? Sign UP', style: TextStyle(fontSize: 12,color: Colors.grey)),

                           GestureDetector(
                               onTap: (){
                                 Navigator.push(
                                   context,
                                   PageRouteBuilder(
                                     pageBuilder: (c, a1, a2) => Sign_up(),
                                     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                     transitionDuration: Duration(milliseconds: 100),
                                   ),
                                 );

                               },
                               child:
                               Text(" Sign up", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,
                                   color: Colors.amber),)),





                         ],
                       ),
                     ),
                   ],
                 ),
                  // color: Colors.black,
                 )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AppBottomNavigationBar())),
        });
        User? user = _auth.currentUser;
        DocumentSnapshot document = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user!.uid)
            .get();
        Map userData = (document.data() as Map);
        UserModel userModel = UserModel(
          
          // uid: int.parse(user.uid),
          uid: user.uid,
          fullname: userData['fullname'],
          email: userData['email'],
         // password: userData['password'],
        );
        log('loginuerid'+userModel.uid.toString());
        MySharedPrefrences.setUserData(userModel: userModel);
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!,
          gravity: ToastGravity.BOTTOM,
        );
        print(error.code);
      }
    }
  }
}
