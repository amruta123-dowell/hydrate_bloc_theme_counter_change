import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrate_bloc_theme_counter_change/themeBloc/theme_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'counterBloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Text(
          "${context.watch<CounterBloc>().state.counter}",
          style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                fontSize: 50,
                color:
                    context.watch<ThemeBloc>().state.themeType == ThemeType.dark
                        ? Colors.white
                        : Colors.black,
              ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            child: const Icon(Icons.light_mode_sharp),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add_circle_outlined),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove_circle_outlined),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            child: const Icon(Icons.delete),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
