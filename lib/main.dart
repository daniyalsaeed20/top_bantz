import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:top_bantz/bloc/live_bloc.dart';
import 'package:top_bantz/create-account/starting_screen.dart';
import 'package:top_bantz/new_modules/chat_room/view/group_chat_screen.dart';
import 'package:top_bantz/new_modules/video_texts/test_ui.dart';
// import 'package:top_bantz/new_modules/audio_texts/test_ui.dart';
import 'package:top_bantz/profile_screen/profile.dart';
import 'package:top_bantz/select_avatar.dart';
import 'package:top_bantz/select_subscription.dart';
import 'package:top_bantz/splash_screen/splash.dart';
import 'package:uuid/uuid.dart';

import 'bottom_navigation/app_bootom_navigation_bar.dart';
import 'bottom_navigation/standing_screen.dart';
import 'create-account/login screen.dart';
import 'create-account/registration screen.dart';

var uuid = Uuid();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(),
  );
  // runApp(
  //   // DevicePreview(
  //   //   enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LiveBloc(),
      ),
      // BlocProvider(create: (context) => PoliceNameBloc(),),
      // BlocProvider(create: (context)=>InitBloc(),)
    ], child: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, _) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home: const HomeMainScreen(),
          // home: LoginScreen(),
          home: const SplashScreen(),
          // home: GroupChatScreen(),
          // home: TestUi(),
          // home:  SamplePage(),
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//      return MultiBlocProvider(
//
//
//
//     );
//   }
// }
//
//
// class First extends StatefulWidget {
//   const First({Key? key}) : super(key: key);
//
//   @override
//   _FirstState createState() => _FirstState();
// }
//
// class _FirstState extends State<First> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


