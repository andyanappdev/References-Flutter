import 'package:bloc_pattern/repository/repository_sample.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBlocDi extends Bloc<SampleDIEvent, int> {
  final RepositorySample _repositorySample;
  SampleBlocDi(this._repositorySample) : super(0) {
    on<SampleDIEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });
  }
}

class SampleDIEvent {}

class ContentState extends Equatable {
  final String? cid;
  final String? title;
  final String? description;
  final bool? isLiked;

  const ContentState({
    this.cid,
    this.title,
    this.description,
    this.isLiked,
  });

  @override
  List<Object?> get props => [];
}
