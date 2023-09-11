import 'package:bloc_pattern/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerScreen extends StatelessWidget {
  const BlocConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),
          content: const Text('Dialog Content'),
          actions: [
            ElevatedButton(
              child: const Text("확인"),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer'),
      ),
      body: Center(
        child: BlocConsumer<SampleBloc, int>(
          listenWhen: (previous, current) => current > 5,
          listener: (context, state) {
            _showMessage(context);
          },
          buildWhen: (previous, current) => current % 2 == 0,
          builder: (context, state) => Text(
            state.toString(),
            style: const TextStyle(fontSize: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
