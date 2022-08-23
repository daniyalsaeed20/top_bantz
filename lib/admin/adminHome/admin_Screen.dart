import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:top_bantz/admin/Add%20product.dart';

import '../../constants.dart';
import '../../models/methods.dart';




class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final MethodsHandler _methodsHandler = MethodsHandler();
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPurpleColor,
        title:  Text(
          'Top Bantz',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
            color: Colors.white,
            child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 230,
                  width: 305,
                  child: DrawerHeader(
                      decoration:  BoxDecoration(
                        color: kPurpleColor,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                              height: 90,
                              width: 305,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1576667896105-31ffa7b30722?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FscGFwZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                              )),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20),
                          //   child: Text(
                          //     MyApp.userType,
                          //     style: const TextStyle(color: Colors.white),
                          //   ),
                          // ),
                          // Text(
                          //   MyApp.email,
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        ],
                      )),
                ),
                ListTile(
                  onTap: () {
                    _methodsHandler.signOut(context);
                  },
                  leading: const Icon(Icons.logout, color: Colors.black),
                  title: const Text('logout',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.black),
                ),
              ],
            )),
      ),
      body: Container(
        width: devSize.width,
        child: Column(
          children: [
            SizedBox(
              height: devSize.height * 0.1,
            ),
            Container(
              child: const Text(
                'Admin',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: devSize.height * 0.05,
            ),
            Container(
              child: const Text(
                'Please select One',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: devSize.height * 0.05,
            ),
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.height * 0.07
                  : devSize.height * 0.1,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.width * 0.5
                  : devSize.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kPurpleColor,
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddteamDetails()));
                },
                child: const Text('Add Team Details'),
              ),
            ),
            SizedBox(
              height: devSize.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.height * 0.07
                  : devSize.height * 0.1,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.width * 0.5
                  : devSize.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kPurpleColor,
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ProductsScreen()));
                },
                child: const Text('Products'),
              ),
            ),
            SizedBox(
              height: devSize.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.height * 0.07
                  : devSize.height * 0.1,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? devSize.width * 0.5
                  : devSize.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kPurpleColor,
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const OrderHistoryScreen()));
                },
                child: const Text('View Order history'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
