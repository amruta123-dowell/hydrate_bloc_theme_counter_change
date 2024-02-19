import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrate_bloc_theme_counter_change/counterBloc/counter_bloc.dart';
import 'package:hydrate_bloc_theme_counter_change/home_screen.dart';
import 'package:hydrate_bloc_theme_counter_change/themeBloc/theme_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeType == ThemeType.dark
                ? ThemeData.dark(useMaterial3: true)
                : ThemeData.light(useMaterial3: true),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
