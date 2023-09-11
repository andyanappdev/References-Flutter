import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    log('init Samplebloc');
    on<SampleEvent>((event, emit) {
      log('Sample Event Called');
    });
    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}
