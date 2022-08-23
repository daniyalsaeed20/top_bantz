import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:top_bantz/models/methods.dart';
import 'package:email_validator/email_validator.dart';
import 'package:top_bantz/models/sharedPrefrences.dart';
import '../models/UserModel.dart';
import '../profile_screen/select team.dart';
import '../select_subscription.dart';
import 'login screen.dart';


class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  String? errorMessage;
  FirebaseAuth _auth  = FirebaseAuth.instance;
  TextEditingController fullname = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateofbirth.text = ""; //set the initial value of text field
    super.initState();
  }
  TextEditingController email = TextEditingController();
 // TextEditingController dateofbirth = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Cpassword = TextEditingController();
  MethodsHandler _methodsHandler = MethodsHandler();
  bool _obscureText = true;
  bool _obscureText1 = true;
  String? name,phone;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    //  _obscureText1 = !_obscureText1;
    });
  }
  void _toggle1() {
    setState(() {
      //_obscureText = !_obscureText;
      _obscureText1 = !_obscureText1;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                SizedBox(
                  height: size.height*.07,
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => LoginScreen(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 0),
                          ));
                    },
                    child: Container(
                      width: size.width*.85,
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                Container(
                //  alignment: Alignment.centerLeft,
                  height: size.height*.09,
                  width: size.width*.85,
                  child: Row(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          height: size.height*.09,
                          width: size.width*.55,
                          child: Text("Register New Account",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900),)),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*.04,
                ),
                Container(

                  height: size.height*.06,
                  width: size.width*.85,
                  decoration: BoxDecoration(
                      color: Color(0xff212020),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                    style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
                     controller: fullname,
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        prefixIcon:Icon(Icons.person,color: Color(0xff65656b),),
                        border: InputBorder.none,
                       // labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                        hintText: 'Full Name',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value){
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height*.03,
                ),
                Container(

                  height: size.height*.06,
                  width: size.width*.85,
                  decoration: BoxDecoration(
                      color: Color(0xff212020),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                    style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
controller: email,
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        prefixIcon:Icon(Icons.email_outlined,color: Color(0xff65656b),),
                        border: InputBorder.none,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(9),
                        // ) ,

                       // labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                        hintText: 'Email',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                    ),
                    validator: (value) {
                      if (value != null || value!.isNotEmpty) {
                        final RegExp regex =
                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        if (!regex.hasMatch(value!))
                          return 'Enter a valid email';
                        else
                          return null;
                      } else {
                        return 'Enter a valid email';
                      }},
                  ),
                ),
                SizedBox(
                  height: size.height*.03,
                ),
                Container(
                  //  padding: EdgeInsets.all(15),
                    height: size.height*.06,
                    width: size.width*.85,
                    decoration: BoxDecoration(
                        color: Color(0xff212020),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:Center(
                        child:TextField(
                          style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
                          controller: dateofbirth,
                          decoration:  InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 15.0),
                              prefixIcon:Icon(Icons.phone,color: Color(0xff65656b),),
                              border: InputBorder.none,
                              //labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                              hintText: 'Date of Birth',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                          ),

                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateofbirth.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                        )
                    )
                ),

                SizedBox(
                  height: size.height*.03,
                ),
                Container(
                  height: size.height*.06,
                  width: size.width*.85,
                  decoration: BoxDecoration(
                      color: Color(0xff212020),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                    style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
                    controller: contactno,
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        prefixIcon:Icon(Icons.phone,color: Color(0xff65656b),),
                        border: InputBorder.none,
                        //labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                       hintText: 'Contact No',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                    ),

                  validator: (value) {

                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = new RegExp(patttern);
                if (value!.length == 0) {
                return 'Please enter mobile number';
                }
                else if (!regExp.hasMatch(value)) {
                return 'Please enter valid mobile number';
                }
                return null;
                    },
                    inputFormatters: [
                      MaskedInputFormatter('000000000000',

                          allowedCharMatcher: RegExp(
                              r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$'))
                    ],

                  ),
                ),
                SizedBox(
                  height: size.height*.03,
                ),
                Container(

                  height: size.height*.06,
                  width: size.width*.85,
                  decoration: BoxDecoration(
                      color: Color(0xff212020),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                    style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
controller: password,
                    obscureText: _obscureText,
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        prefixIcon:Icon(Icons.vpn_key,color: Color(0xff65656b),),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              _toggle();
                            },
                            child: Icon(Icons.visibility_off,color: Color(0xff65656b),)),
                        border: InputBorder.none,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(9),
                        // ) ,

                       // labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                        hintText: 'Password',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
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

                  height: size.height*.06,
                  width: size.width*.85,
                  decoration: BoxDecoration(
                      color: Color(0xff212020),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                    style:  TextStyle(fontSize:12,color: Color(0xff65656b),),
                        controller: Cpassword,
                    obscureText: _obscureText1,
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        prefixIcon:Icon(Icons.vpn_key,color: Color(0xff65656b),),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              _toggle1();
                            },
                            child: Icon(Icons.visibility_off,color: Color(0xff65656b),)),
                        border: InputBorder.none,
                      //  labelText: 'Password',labelStyle: TextStyle(fontSize: 12,color: Colors.transparent,),
                      hintText: 'Confirm Password',hintStyle: TextStyle(fontSize: 12,color: Color(0xff65656b),)
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(password.text);
                      print(Cpassword.text);
                      if(password.text!=Cpassword.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
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
                        signUp(email.text, password.text);
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



              ],
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
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
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // UserModel userModel = UserModel(uid: int.parse(user!.uid), email: user.email, fullName: _fullName.text, password: _password.text);
    UserModel userModel = UserModel(uid: user!.uid, email: user.email, fullname: fullname.text, password: password.text,
    ContactNo: contactno.text,Dateofbirth: dateofbirth.text,
    );
MySharedPrefrences.setUserData(userModel: userModel );

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => SelectTeam()),
            (route) => false);
  }
}
