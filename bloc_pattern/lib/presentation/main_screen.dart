import 'package:bloc_pattern/presentation/bloc_builder_screen.dart';
import 'package:bloc_pattern/presentation/bloc_consumer_screen.dart';
import 'package:bloc_pattern/presentation/bloc_listener_screen.dart';
import 'package:bloc_pattern/presentation/bloc_provider_screen.dart';
import 'package:bloc_pattern/presentation/bloc_selector_screen.dart';
import 'package:bloc_pattern/presentation/multi_bloc_provider_screen.dart';
import 'package:bloc_pattern/presentation/multi_repository_provider_screen.dart';
import 'package:bloc_pattern/presentation/repository_provider_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Practice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BlocProviderScreen()),
                );
              },
              child: const Text('BlocProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MultiBlocProviderSereen()),
                );
              },
              child: const Text('MultiBlocProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocBuilderScreen()),
                );
              },
              child: const Text('BlocBuilder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RepositoryProviderScreen()),
                );
              },
              child: const Text('RepositoryProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MultiRepositoryProviderScreen()),
                );
              },
              child: const Text('MultiRepositoryProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocSelectorScreen()),
                );
              },
              child: const Text('BlocSelector'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocListenerScreen()),
                );
              },
              child: const Text('BlocListener'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocConsumerScreen()),
                );
              },
              child: const Text('BlocConsumer'),
            ),
          ],
        ),
      ),
    );
  }
}
