part of 'global_bloc.dart';

@immutable
abstract class GlobalState {}

class None extends GlobalState {}
class SnackBarState extends GlobalState{
  final String message;

  SnackBarState(this.message);
}

class LoadingState extends GlobalState{

}
class NoneState extends GlobalState{

}
