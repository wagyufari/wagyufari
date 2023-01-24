import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(None()) {
    on<SnackBarEvent>((event, emit) {
      emit(SnackBarState("${event.message}"));
    });
    on<LoadingEvent>((event, emit) {
      emit(LoadingState());
    });
    on<NoneEvent>((event, emit) {
      emit(NoneState());
    });

  }
}

void showLoading(BuildContext context){
  context.read<GlobalBloc>().add(LoadingEvent());
}

void hideLoading(BuildContext context){
  context.read<GlobalBloc>().add(NoneEvent());
}


void showSnackbar(BuildContext context, {String? message}){
  context.read<GlobalBloc>().add(SnackBarEvent(message: message));
}