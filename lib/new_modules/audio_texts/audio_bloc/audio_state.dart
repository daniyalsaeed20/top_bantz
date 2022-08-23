part of 'audio_bloc.dart';

@immutable
abstract class AudioState {}

class AudioInitial extends AudioState {}
class IsRecordingState extends AudioState {}
class IsNotRecordingState extends AudioState {}
class IsPlayingState extends AudioState {}
class IsNotPlayingState extends AudioState {}
