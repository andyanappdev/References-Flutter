import 'dart:developer';

import 'package:bloc_pattern/bloc/bloc_selector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorScreen extends StatelessWidget {
  const BlocSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
      child: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
              selector: (state) => state.changeState,
              builder: (context, state) {
                log('selector builder');
                return Icon(
                  Icons.favorite,
                  color: state ? Colors.red : Colors.grey,
                  size: 50,
                );
              },
            ),
            BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
              buildWhen: (previous, current) => current.changeState,
              builder: (context, state) {
                log('bloc builder');
                return Text(
                  state.value.toString(),
                  style: const TextStyle(fontSize: 70),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                    },
                    child: const Text('상태변경')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ValueEvent());
                    },
                    child: const Text('더하기')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
