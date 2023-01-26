part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {

}

class NoneEvent extends GlobalEvent{}


class PushEvent extends GlobalEvent{
  final String identifier;

  PushEvent(this.identifier);

}
