import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/liveScore.dart';

part 'live_event.dart';
part 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  LiveBloc() : super(Loading()) {
    on<LiveEvent>((event, emit) async {
      try{
        if(event is TheLiveScoreEvent){
          Dio dio = new Dio();
          Response response = await dio.get('https://soccer.sportmonks.com/api/v2.0/leagues',
          queryParameters: {
            'api_token':'0AHk6PmPOSzalDnYoDuX2x80xKc9J9gPlkxP5uT3JYejo5G5E4e5U14q0zVo'
          }
          );
          print('response' + response.toString());
          emit.call(LiveInitial(data: Data.fromJson(response.data)));
        }
      }catch(e){
        print(e.toString());
      }
      
      
      // TODO: implement event handler
    });
  }
}
