import 'package:flutter/material.dart';

import '../chat_support.dart';
import '../email_support.dart';
import '../payment_selection.dart';


class About3 extends StatefulWidget {
  const About3({Key? key}) : super(key: key);

  @override
  _About3State createState() => _About3State();
}

class _About3State extends State<About3> {
  List<String> settingss = [
    'Change Payment Options',
    'Email Support',
    'chat Support',
    'Donate'
  ];
  List<String> setimage = [
    'assets/images/icon/Vector.png',
    'assets/images/icon/email.png',
    'assets/images/icon/chat.png',
    'assets/images/icon/donate.png'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      width: size.width * .85,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                if (settingss[index] == 'Change Payment Options') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Payment(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 100),
                    ),
                  );
                } else if (settingss[index] == 'Email Support') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Email_support(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 100),
                    ),
                  );
                } else if (settingss[index] == 'chat Support') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Chat_support(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 100),
                    ),
                  );
                } else if (settingss[index] == 'Donate') {
                  openAlertBox();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: size.height * .06,
                  width: size.width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: size.height * .02,
                          width: size.width * .1,
                          child: Image.asset(
                            setimage[index].toString(),
                            color: Colors.white,
                          )),
                      Container(
                        width: size.width * .55,
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          SizedBox(
                            height: size.height * .015,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                settingss[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          // // Container(
                          //     alignment: Alignment.centerLeft,child: Text(email[index],style: TextStyle(fontSize: 12,color: Color(0xffaaaaaa)),)),
                        ]),
                      ),
                      IconButton(
                          onPressed: () {
                            // Navigator.push(
                            // context,
                            // PageRouteBuilder(
                            // pageBuilder: (c, a1, a2) => Standing_details(),
                            // transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                            // transitionDuration: Duration(milliseconds: 100),
                            // ),
                            // );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;

          List<String> reportList = [
            "\$20.00",
            "\$30.00",
            "\$40.00",
            "\$50.00",
            "\$60.00",
            "\$70.00",
            "\$80.00",
            "\$90.00",
          ];

          List<String> selectedReportList = [];
          return AlertDialog(
            backgroundColor: Color(0xff212020),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              height: size.height * .40,
              width: 350.00,
              decoration: BoxDecoration(
                color: Color(0xff212020),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 19,
                  ),
                  MultiSelectChip(
                    reportList,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedReportList = selectedList;
                      });
                    },
                    maxSelection: 8,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: size.height * .06,
                    width: size.width * .75,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * .06,
                    //  color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? size.height * .06
                              : size.height * .08,
                          width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? size.width * .75
                              : size.width * .40,
                          // color: Colors.blue,
                          //   alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                            // ],
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                //  minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
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
                                  Text(
                                    'Donate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff1C3857),
                                        letterSpacing: .05,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //   Icon(Icons.arrow_forward)
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  MultiSelectChip(this.reportList,
      {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  //final size =MediaQuery.of(context).size;

  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        //  color: Colors.red,
        //   height: 200,
        width: 70,
        padding: const EdgeInsets.all(1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
          child: ChoiceChip(
            selectedColor: Color(0xffDFAE00),
            backgroundColor: Colors.black,
            label: Text(item,
                style: TextStyle(
                    color: selectedChoices.contains(item)
                        ? Colors.white
                        : Color(0xff65656B),
                    fontSize: 12)),
            selected: selectedChoices.contains(item),
            onSelected: (selected) {
              if (selectedChoices.length == (widget.maxSelection ?? -1) &&
                  !selectedChoices.contains(item)) {
                widget.onMaxSelected?.call(selectedChoices);
              } else {
                setState(() {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                  widget.onSelectionChanged?.call(selectedChoices);
                });
              }
            },
          ),
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}