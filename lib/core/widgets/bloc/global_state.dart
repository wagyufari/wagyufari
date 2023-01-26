part of 'global_bloc.dart';

@immutable
abstract class GlobalState {}

class None extends GlobalState {}
class PushState extends GlobalState{
  final String identifier;

  PushState(this.identifier);
}
class NoneState extends GlobalState{
}
