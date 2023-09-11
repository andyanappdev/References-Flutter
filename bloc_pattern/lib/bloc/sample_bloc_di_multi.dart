import 'package:bloc_pattern/repository/repository_sample.dart';
import 'package:bloc_pattern/repository/repository_second_sample.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBlocDiMulti extends Bloc<SampleDiMultiEvent, int> {
  final RepositorySample _repositorySample;
  final RepositorySecondSample _repositorySecondSample;
  SampleBlocDiMulti(this._repositorySample, this._repositorySecondSample)
      : super(0) {
    on<SampleDiFirstEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });
    on<SampleDiSecondEvent>((event, emit) async {
      var data = await _repositorySecondSample.load();
      emit(data);
    });
  }
}

abstract class SampleDiMultiEvent {}

class SampleDiFirstEvent extends SampleDiMultiEvent {}

class SampleDiSecondEvent extends SampleDiMultiEvent {}
