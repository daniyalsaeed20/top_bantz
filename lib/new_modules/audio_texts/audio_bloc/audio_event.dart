part of 'audio_bloc.dart';

@immutable
abstract class AudioEvent {}

class IsRecordingEvent extends AudioEvent {}

class IsNotRecordingEvent extends AudioEvent {}

class IsPlayingEvent extends AudioEvent {}

class IsNotPlayingEvent extends AudioEvent {}
