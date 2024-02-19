import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initialState()) {
    on<ThemeEvent>((event, emit) {
      hydrate();
    });
    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(
          themeType: state.themeType == ThemeType.dark
              ? ThemeType.light
              : ThemeType.dark));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final themeState = ThemeState.fromJson(json);

    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    final toJsonData = state.toJson();

    return toJsonData;
  }
}

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
//   ThemeBloc() : super(ThemeState.initialState()) {
//     hydrate();

//     on<ToggleThemeEvent>((event, emit) {
//       emit(
//         state.copyWith(
//           themeType: state.themeType == ThemeType.light
//               ? ThemeType.dark
//               : ThemeType.light,
//         ),
//       );
//     });
//   }

//   @override
//   ThemeState? fromJson(Map<String, dynamic> json) {
//     print('Theme from storage: $json');
//     final themeState = ThemeState.fromJson(json);
//     print('ThemeState: $themeState');
//     return themeState;
//   }

//   @override
//   Map<String, dynamic>? toJson(ThemeState state) {
//     print('Theme state to storage: $state');
//     final themeJson = state.toJson();
//     print('ThemeJson: $themeJson');
//     return themeJson;
//   }
// }
