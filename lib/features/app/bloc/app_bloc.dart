import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagyufari/core/prefs/prefs.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.authenticated()) {

    on<AppDefaultEvent>((event, emit) async{
      String? accessToken = await Prefs.accessToken();
      emit((accessToken != null && accessToken.isNotEmpty) ? AppState.authenticated() : AppState.unauthenticated());
    });
    on<AppLoginEvent>((event, emit) async{
      await Prefs.accessToken(token: event.accessToken);
      emit(AppState.authenticated());
    });
    on<AppLogoutEvent>((event, emit) async{
      await Prefs.accessToken(token: "");
      emit(AppState.unauthenticated());
    });
  }
}

void signOut(BuildContext context){
  context.read<AppBloc>().add(AppLogoutEvent());
}
