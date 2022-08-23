import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'livescore_screen.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Barcelona VS Real Madrid",
      "date": 'Monday, 12 Feb 2021 . 02.30 am'
    },
    {
      "id": 2,
      "name": "Aersenal VS Aston Villa",
      "date": 'Monday, 12 Feb 2021 . 02.30 am'
    },
    {
      "id": 3,
      "name": "Chelsea VS Liverpool",
      "date": 'Monday, 12 Feb 2021 . 02.30 am'
    },
    {
      "id": 4,
      "name": "Dortmund VS  München",
      "date": 'Wednesday, 8 Apr 2021 . 02.30 am'
    },
    {
      "id": 5,
      "name": "Real Madrid VS Arsenal",
      "date": 'Friday, 21 Apr 2021 . 00.45 am'
    },
    {
      "id": 6,
      "name": "Tottenham VS Watford",
      "date": 'Sunday, 2 May 2021 . 04.45 am'
    },
    {
      "id": 7,
      "name": "Swansea City VS Fulham",
      "date": 'Sunday, 2 May 2021 . 04.45 am'
    },
    {
      "id": 8,
      "name": "Wolfsburg VS Liverpool",
      "date": 'Sunday, 2 May 2021 . 04.45 am'
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .07,
              ),
              Container(
                width: size.width * .85,
                child: Row(
                  children: [
                    Container(
                      height: size.height * .06,
                      width: size.width * .65,
                      decoration: BoxDecoration(
                          color: Color(0xff212020),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        style:
                            TextStyle(color: Color(0xff65656b), fontSize: 12),
                        onChanged: (value) => _runFilter(value),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff65656b),
                            ),
                            border: InputBorder.none,
                            hintText: 'Search Your Team...',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xff65656b),
                            )),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: size.height * .09,
                        width: size.width * .20,
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        )),
                  ],
                ),
              ),
              Container(
                height: size.height * .04,
                width: size.width * .85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/fire.png'),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => LiveScore(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 0),
                            ));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: size.height * .09,
                          width: size.width * .20,
                          child: Text(
                            "Live Score",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          )),
                    ),
                    Image.asset('assets/images/icon/newspaper.png'),
                    Image.asset('assets/images/icon/hash.png'),
                    Image.asset('assets/images/stadium.png'),
                  ],
                ),
              ),
              Container(
                height: size.height * .72,
                width: size.width * .85,
                child: StreamBuilder(

                        stream: FirebaseFirestore.instance.collection('list').snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if(streamSnapshot.hasData){
                            return ListView.builder(
                              key: ValueKey(_foundUsers),
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: size.height * .09,
                                    width: size.width * .85,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(alignment: Alignment.center, children: [
                                          Container(
                                            height: size.height * .06,
                                            width: size.width * .12,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.blue),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                              height: size.height * .04,
                                              width: size.width * .08,
                                              child: Image.network(streamSnapshot.data!
                                                  .docs[index]['image'][0].toString(),
                                                fit: BoxFit.cover,
                                              )),
                                        ]),
                                        Container(
                                            height: size.height * .04,
                                            width: size.width * .1,
                                            child: Image.network(streamSnapshot.data!
                                                .docs[index]['image'][0].toString(),)),
                                        Container(
                                          height: size.height * .06,
                                          width: size.width * .50,
                                          child: Column(
                                            children: [
                                              Container(
                                                  alignment: Alignment.centerLeft,
                                                  height: size.height * .03,
                                                  width: size.width * .50,
                                                  child: Text(
                                                    streamSnapshot.data!.docs[index]['Title'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w900),
                                                  )),
                                              Container(
                                                  alignment: Alignment.centerLeft,
                                                  height: size.height * .03,
                                                  width: size.width * .50,
                                                  child: Text(
                                                    streamSnapshot.data!.docs[index]['name'].toString(),

                                                    // _foundUsers[index]["date"].toString(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Color(0xff65656b),
                                                        fontWeight: FontWeight.w500),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.cancel,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });}
                          else {return Container(
                            child: CircularProgressIndicator(),
                          );}

                  }
                )

              )
            ],
          ),
        ),
      ),
    );
  }
}
