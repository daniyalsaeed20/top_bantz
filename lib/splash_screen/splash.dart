import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:top_bantz/bottom_navigation/home_page.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/models/sharedPrefrences.dart';

import '../bottom_navigation/app_bootom_navigation_bar.dart';
import '../create-account/login screen.dart';
import '../create-account/starting_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    // _navigatetohome();
    load();
  }

  Future<void> load() async {
    UserModel ood = await MySharedPrefrences.getUserData();
    String? id;
    id = ood.uid;
    print('id is' + id.toString());
    if (id == null || id == '') {
      Future.delayed(Duration(milliseconds: 3000), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Splash_screen()));
    } else {
      Future.delayed(Duration(milliseconds: 3000), () {});
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AppBottomNavigationBar(
            userModel:ood,
          ),
        ),
      );
    }
  }

  void _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Splash_screen()));
  }

  @override
  Widget build(BuildContext context) {
    final devsize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: devsize.height * .40,
            ),
            Container(
              alignment: Alignment.center,
              height: devsize.height * .2,
              width: devsize.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40)),
              child: Image.asset(
                'assets/images/splash_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
