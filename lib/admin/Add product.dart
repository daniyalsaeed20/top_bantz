import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';



class AddteamDetails extends StatefulWidget {
  // final String title;
  // final String docId;
  // final String image;
  // Addcatergory(this.title, this.image, this.docId);


  @override
  _AddteamDetailsState createState() => _AddteamDetailsState();
}

class _AddteamDetailsState extends State<AddteamDetails> {
  TextEditingController _title = TextEditingController();
  TextEditingController _title1 = TextEditingController();
  TextEditingController _title2 = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  static String ? userUid;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void initState() {
    // TODO: implement initState
    setState(() {
      //_title.text = widget.title;
      //   _idCardImages.= widget.image;
    });
    super.initState();
  }

  File? image;
  bool isLoading = false;
  //FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static List<String> _idCardImages = [];
  late PickedFile _pickedFile;
  _imgFromCamera() async {
    _pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50))!;
    setState(() {
      print('List Printed');
      getUrl(_pickedFile.path).then((value) {
        if (value != null) {
          setState(() {
            _idCardImages.add(value);
            isLoading = false;
          });
        } else {
          print('sorry error');
        }
      });
    });
  }

  _imgFromGallery() async {
    _pickedFile = (await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50))!;
    setState(() {
      print('List Printed');
      getUrl(_pickedFile.path).then((value) {
        if (value != null) {
          setState(() {
            _idCardImages.add(value);
            isLoading = false;
          });
        } else {
          print('sorry error');
        }
      });
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String?> getUrl(String path) async {
    final file = File(path);
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("image" + DateTime.now().toString())
        .putFile(file);
    if (snapshot.state == TaskState.success) {
      return await snapshot.ref.getDownloadURL();
    }
    //   print(_imagePath);

    print(_idCardImages.length.toString() + " HTTPS://F");
    print(_idCardImages);
    print(_idCardImages);
  }


  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Category',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,),),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Container(
            width: devSize.width,
            child: Column(
              children: [
                SizedBox(
                  height: devSize.height * 0.03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.height * 0.05
                      : devSize.height * 0.1,
                  width: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.width * 0.92
                      : devSize.width * 0.7,
                  // color: Colors.blue,
                  child: Text(
                    'Catergory Title:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.height * 0.07
                      : devSize.height * 0.1,
                  width: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.width * 0.92
                      : devSize.width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: Colors.white),
                  child: TextFormField(
                    controller: _title,
                    decoration: InputDecoration(
                        hintText: 'Enter Team title',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xFF0A62B4), width: 2)),
                        contentPadding: EdgeInsets.all(
                          8,
                        ),
                        fillColor: Colors.white),
                    validator: (values) {
                      if (values!.isEmpty) {
                        return ('Please Enter team name');
                      }
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.height * 0.07
                      : devSize.height * 0.1,
                  width: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.width * 0.92
                      : devSize.width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: Colors.white),
                  child: TextFormField(
                    controller: _title1,
                    decoration: InputDecoration(
                        hintText: 'Enter date',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xFF0A62B4), width: 2)),
                        contentPadding: EdgeInsets.all(
                          8,
                        ),
                        fillColor: Colors.white),
                    validator: (values) {
                      if (values!.isEmpty) {
                        return ('Please Enter date');
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: devSize.height * 0.04,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.height * 0.05
                      : devSize.height * 0.1,
                  width: MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.width * 0.92
                      : devSize.width * 0.7,
                  child: Text(
                    'Upload an image:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                    //  _openFileExplorer();
                    setState(() {
                      isLoading = true;
                    });
                  },
                  child: Container(
                    //color: Colors.green,
                    height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? devSize.height * 0.075
                        : devSize.height * 0.1,
                    width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? devSize.width * 0.92
                        : devSize.width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 0),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.blue,
                      //  color: Color(0xFFA71C12),

                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.5,
                            2
                          ],
                          colors: [
                            Colors.blue,
                            Colors.lightBlueAccent,
                          ]),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 0, left: 8),
                          //color: Colors.cyan,
                          alignment: Alignment.centerLeft,
                          width:
                          MediaQuery.of(context).orientation == Orientation.portrait
                              ? devSize.width * 0.65
                              : devSize.width * 0.455,
                          height: devSize.height * 0.05,
                          child: Text(
                            'Upload image',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            alignment: Alignment.centerRight,
                            width: devSize.width * 0.2,
                            height: devSize.height * 0.08,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),

                _idCardImages.length == 0
                    ? SizedBox(
                  height: 0,
                )
                    : SizedBox(
                  height: 10,
                ),
                _idCardImages.length == 0
                //&& isLoading == true
                    ? Center(
                  child: Container(
                    //       height: isLoading ? 30 : 0,
                    child: isLoading
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                        : Container(),
                  ),
                )
                    : Container(
                  height: devSize.height * 0.12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _idCardImages.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Container(
                          alignment: Alignment.topLeft,
                          width: devSize.width * 0.25,
                          height: devSize.height * 0.1,
                          decoration: BoxDecoration(
                            //color: kLightBlueColor,
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     PageRouteBuilder(
                                  //       pageBuilder: (c, a1, a2) => ViewImage(image: _idCardImages[index]),
                                  //       transitionsBuilder: (c, anim, a2, child) =>
                                  //           FadeTransition(opacity: anim, child: child),
                                  //       transitionDuration: Duration(milliseconds: 0),
                                  //     ));
                                },
                                child: Container(
                                  // width: devSize.width*0.35,
                                  // height: devSize.height*0.1,
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                    // color: kLightBlueColor,
                                  ),
                                  child: _idCardImages[index].isEmpty
                                      ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg',
                                      width: 90,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                      : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      _idCardImages[index],
                                      width: 90,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 50,
                                //right: 0,
                                //left: 50,
                                bottom: 50,
                                child: Container(
                                  // width: devSize.width*0.035,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        print('hello');
                                        _idCardImages.removeAt(index);

                                      });
                                      //auth.getPictureID(context);
                                    },
                                    child: MaterialButton(
                                      onPressed: () async {
                                        // SharedPreferences prefs =
                                        // await SharedPreferences
                                        //     .getInstance();
                                        // setState(() {
                                        //   MyApp.picture_id =
                                        //       prefs.getInt('picture_id');
                                        // });
                                        print('hello');
                                        setState(() {
                                          _idCardImages.removeAt(index);
                                        });
                                        // auth.removePictureID(widget.id,widget.index,context);
                                      },
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.cancel,
                                        size: 10,
                                      ),
                                      minWidth: devSize.width * 0.035,
                                      padding: EdgeInsets.all(0),
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  height:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.height * 0.075
                      : devSize.height * 0.1,
                  width:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? devSize.width * 0.92
                      : devSize.width * 0.7,

                  child: ElevatedButton(

                    onPressed: () async {
                      if(_key.currentState!.validate()){
                        await FirebaseFirestore.instance.collection('list').doc().set(
                            {
                              'Title': _title.text,
                              'name':_title1.text,
                              'name1':_title2.text,
                           //  'caseTitle': searchCaseByTitle(title),
                              'image': _idCardImages,

                             // 'uid': _auth.currentUser!.uid.toString(),
                            }
                        ).then((value){
                          _title.clear();
                          _title1.clear();
                          _title2.clear();
                          _idCardImages.clear();
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Admin()));
                          Fluttertoast.showToast(
                            msg: 'Category Added',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            //timeInSecForIosWeb: 10,
                          );
                        });

                      }
                    }, child: Text('Add Team Details'),


                  ),
                ),


              ],
            ),
          ),
        ),
      ),

    );
  }
  // searchCaseByTitle(String title){
  //   List<String> _caseSerachByTitle = [];
  //   String temp= '';
  //   for(int i=0; i<title.length;i++) {
  //     temp = temp + title[i];
  //     _caseSerachByTitle.add(temp);
  //   }
  //   return _caseSerachByTitle;
  // }
}

