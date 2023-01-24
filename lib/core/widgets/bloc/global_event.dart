part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {

}

class NoneEvent extends GlobalEvent{}

class SnackBarEvent extends GlobalEvent{
  final String? message;

  SnackBarEvent({this.message});
}

class LoadingEvent extends GlobalEvent{}
