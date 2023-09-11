import 'package:bloc_pattern/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderScreen extends StatelessWidget {
  const BlocBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      lazy: false,
      child: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  // bloc을 등록해야 사용이 가능한 케이스
  late SampleBloc sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),
          content: BlocBuilder<SampleBloc, int>(
            bloc: sampleBloc,
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          actions: [
            ElevatedButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    sampleBloc = context.read<SampleBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
      ),
      body: Center(
        child: BlocBuilder<SampleBloc, int>(
          buildWhen: (previous, current) {
            return current > 10;
          },
          builder: (context, state) {
            return Text(
              'index : $state',
              style: const TextStyle(fontSize: 70),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<SampleBloc>().add(AddSampleEvent());
          _showMessage(context);
        },
      ),
    );
  }
}
