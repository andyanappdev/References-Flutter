import 'package:bloc_pattern/bloc/sample_bloc.dart';
import 'package:bloc_pattern/bloc/sample_second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderSereen extends StatelessWidget {
  const MultiBlocProviderSereen({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => SampleBloc(),
    //   child: BlocProvider(
    //     create: (context) => SampleSecondsBloc(),
    //     child: SampleScreen(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => SampleBloc())),
        BlocProvider(create: ((context) => SampleSecondBloc())),
      ],
      child: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Bloc Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleBloc>().add(SampleEvent());
                    },
                    child: const Text('+')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleSecondBloc>().add(SampleSecondEvent());
                    },
                    child: const Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
