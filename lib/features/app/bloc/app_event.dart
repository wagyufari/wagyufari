part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppDefaultEvent extends AppEvent{
}
class AppLogoutEvent extends AppEvent{
}
class AppLoginEvent extends AppEvent{
  final String accessToken;

  AppLoginEvent(this.accessToken);
}