import 'package:bloc_pattern/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderScreen extends StatelessWidget {
  const BlocProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      lazy: false,
      child: SampleSreen(),
    );
  }
}

class SampleSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider'),
      ),
      body: const Center(
        child: Text('Bloc Provider Sample'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(SampleEvent());
        },
      ),
    );
  }
}
