import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_bantz/bottom_navigation/home_page.dart';
import 'package:top_bantz/bottom_navigation/search_screen.dart';
import 'package:top_bantz/bottom_navigation/standing_screen.dart';

import '../profile_screen/SearchPage.dart';
import '../profile_screen/my_profile.dart';
import '../profile_screen/profile.dart';
import 'earn_coin.dart';


class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    Search_Screen(),
    Earn_Coin(),
    ChatsMainScreen(),
    Standing(),
    My_profile(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: kBackgroundColor,
      body: _pages.elementAt(_selectedIndex),

      bottomNavigationBar: BottomAppBar(

        color: Colors.white,
        child: Container(
          height: 55,
          //  color: Colors.white,
          child: SizedBox(
            height: 70,
            child: CupertinoTabBar(
              activeColor: Color(0xffE0AF02
              ),
              currentIndex: _selectedIndex,
              backgroundColor: Colors.black,
inactiveColor: Colors.grey.withOpacity(.9),
              // selectedFontSize: 10,
              // selectedIconTheme: IconThemeData(
              //   color: kBlackColor,
              //   //size: 28,
              // ),
              iconSize: 40,
              // showSelectedLabels: true,
              // showUnselectedLabels: true,
              // type: BottomNavigationBarType.fixed,
              // selectedItemColor: kDarkGreyColor,
              // selectedLabelStyle: TextStyle(fontSize: 10, color: kBlackColor,),
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(

                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Icons.home_filled,
                      size: 25,
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:  'Home',
                ),



                BottomNavigationBarItem(
                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Icons.explore_outlined,
                      size: 25,
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:'Explore',
                ),
                BottomNavigationBarItem(
                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: ImageIcon(

                      AssetImage("assets/images/earn_coin_image.png"),
                      size: 21,
                      // color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:'Earn Coin',
                ),
                BottomNavigationBarItem(

                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Icons.chat_outlined,
                      size: 25,
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:  'Chat',
                ),
                BottomNavigationBarItem(
                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: ImageIcon(

                      AssetImage("assets/images/Chart.png"),
                      size: 21,
                      // color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:'Standings',
                ),
                BottomNavigationBarItem(
                  icon:  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Icons.person,
                      size: 25,
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                  label:'My Profile',
                ),
              ],
            ),
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
