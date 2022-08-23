import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioInitial()) {
    on<IsRecordingEvent>(_mapIsRecordingEventToState);
    on<IsNotRecordingEvent>(_mapIsNotRecordingEventToState);
    on<IsPlayingEvent>(_mapIsPlayingEventToState);
    on<IsNotPlayingEvent>(_mapIsNotPlayingEventToState);
  }

  _mapIsRecordingEventToState(
      IsRecordingEvent event, Emitter<AudioState> emit) {
    return emit(IsRecordingState());
  }

  _mapIsNotRecordingEventToState(
      IsNotRecordingEvent event, Emitter<AudioState> emit) {
    return emit(IsNotRecordingState());
  }

  _mapIsPlayingEventToState(IsPlayingEvent event, Emitter<AudioState> emit) {
    return emit(IsPlayingState());
  }

  _mapIsNotPlayingEventToState(
      IsNotPlayingEvent event, Emitter<AudioState> emit) {
    return emit(IsNotPlayingState());
  }
}
