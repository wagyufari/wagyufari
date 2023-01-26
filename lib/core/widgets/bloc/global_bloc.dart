import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(None()) {
    on<NoneEvent>((event, emit) {
      emit(NoneState());
    });
    on<PushEvent>((event, emit) {
      emit(PushState(event.identifier));
    });
  }
}

class RxBus{
  static void send(BuildContext context, String identifier) {
    context.read<GlobalBloc>().add(PushEvent(identifier));
  }
}