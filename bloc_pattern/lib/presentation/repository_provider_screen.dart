import 'package:bloc_pattern/bloc/sample_bloc_di.dart';
import 'package:bloc_pattern/repository/repository_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryProviderScreen extends StatelessWidget {
  const RepositoryProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositorySample(),
      child: BlocProvider(
        create: (context) => SampleBlocDi(context.read<RepositorySample>()),
        child: SampleScreen(),
      ),
    );
  }
}

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository Provider'),
      ),
      body: Center(
        child: BlocBuilder<SampleBlocDi, int>(
          builder: (context, state) => Text(
            state.toString(),
            style: const TextStyle(fontSize: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBlocDi>().add(SampleDIEvent());
        },
      ),
    );
  }
}
