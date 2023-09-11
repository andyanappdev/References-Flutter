import 'package:bloc_pattern/bloc/sample_bloc_di_multi.dart';
import 'package:bloc_pattern/repository/repository_sample.dart';
import 'package:bloc_pattern/repository/repository_second_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiRepositoryProviderScreen extends StatelessWidget {
  const MultiRepositoryProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RepositorySample(),
        ),
        RepositoryProvider(
          create: (context) => RepositorySecondSample(),
        )
      ],
      child: BlocProvider(
        create: (context) => SampleBlocDiMulti(
          context.read<RepositorySample>(),
          context.read<RepositorySecondSample>(),
        ),
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
        title: const Text('Multi Repository Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SampleBlocDiMulti, int>(
              builder: (context, state) => Text(
                state.toString(),
                style: const TextStyle(fontSize: 70),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<SampleBlocDiMulti>()
                          .add(SampleDiFirstEvent());
                    },
                    child: const Text('first')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<SampleBlocDiMulti>()
                          .add(SampleDiSecondEvent());
                    },
                    child: const Text('second')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
