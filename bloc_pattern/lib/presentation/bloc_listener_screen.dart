import 'package:bloc_pattern/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerScreen extends StatelessWidget {
  const BlocListenerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  late SampleBloc sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
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
    sampleBloc = context.read<SampleBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Listener'),
      ),
      body: Center(
        child: BlocListener<SampleBloc, int>(
          listenWhen: (previous, current) => current > 5,
          listener: (context, state) {
            _showMessage(context);
          },
          child: BlocBuilder<SampleBloc, int>(
              buildWhen: (previous, current) => current > 5,
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 70),
                );
              }),
        ),
        // child: BlocListener<SampleBloc, int>(
        //   listenWhen: (previous, current) => current > 5,
        //   listener: (context, state) {
        //     _showMessage(context);
        //   },
        //   child: Text(
        //     context.read<SampleBloc>().state.toString(),
        //     style: const TextStyle(fontSize: 70),
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
