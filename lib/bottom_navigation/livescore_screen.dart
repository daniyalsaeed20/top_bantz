import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:top_bantz/bloc/live_bloc.dart';
import 'package:top_bantz/models/liveScore.dart';
class LiveScore extends StatefulWidget {
  const LiveScore({Key? key}) : super(key: key);

  @override
  _LiveScoreState createState() => _LiveScoreState();
}

class _LiveScoreState extends State<LiveScore> {
  List <Data> userList = [];
  Future <List<Data>> getUserApi() async{
    final responce = await http.get(Uri.parse('https://soccer.sportmonks.com/api/v2.0/leagues?api_token=0AHk6PmPOSzalDnYoDuX2x80xKc9J9gPlkxP5uT3JYejo5G5E4e5U14q0zVo'));
    var data = jsonDecode(responce.body.toString());
    if(responce.statusCode==200){
      for(Map i in data){
        print(i['name']);
        userList.add(Data.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }
final List <Data> list= [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LiveBloc>(context).add(TheLiveScoreEvent());
  }
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios),),
        title: Text('Livescore',style: TextStyle(fontSize: 15,color: Colors.white),),
        centerTitle: true,
      ),
      body:BlocConsumer(
        bloc: BlocProvider.of<LiveBloc>(context),
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
          if(state is LiveInitial){
            list.add(state.data);
    return Center(
        child: Column(
          children: [
SizedBox(height: size.height*.04,),

            Container(
              height: size.height*.4,
              width: size.width*.85,
              child: ListView.builder(
                  itemCount:list.length ,
                  itemBuilder: (context, int index) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        height: size.height * .2,
                        width: size.width * .85,
                        decoration: BoxDecoration(
                            color: Color(0xff212020),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * .05,
                              width: size.width * .85,
                              alignment: Alignment.center,
                              child: Text(state.data.name.toString(), style: TextStyle(fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                            ),

                            Container(
                              height: size.height * .05,
                              width: size.width*.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Image.asset(
                                        'assets/images/leagues/barcelona.png'),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Image.asset(
                                        'assets/images/leagues/barcelona.png'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * .01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(state.data.countryId.toString(), style: TextStyle(fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                                Text(state.data.currentStageId.toString(), style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                                Text('Vs', style: TextStyle(fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                                Text(state.data.active.toString(), style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                                Text(state.data.countryId.toString()
                                    //'Aus'
                                    , style: TextStyle(fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: size.height * .02,),
                            Container(
                              child: Text(state.data.currentRoundId.toString(), style: TextStyle(fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),)
          ],
        ),
      );}else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  },
) ,
    );
  }
}
