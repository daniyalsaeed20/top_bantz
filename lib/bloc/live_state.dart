part of 'live_bloc.dart';

@immutable
abstract class LiveState {}

class LiveInitial extends LiveState {
  final Data data;

  LiveInitial({required this.data});
}
class Loading extends LiveState {}
class Success extends LiveState {}
