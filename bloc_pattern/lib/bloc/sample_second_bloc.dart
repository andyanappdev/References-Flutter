import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSecondBloc extends Bloc<SampleSecondEvent, int> {
  SampleSecondBloc() : super(0) {
    on<SampleSecondEvent>((event, emit) {
      log('Sample Second Event Called');
    });
  }
}

class SampleSecondEvent {}
