part of 'theme_bloc.dart';

// class ThemeEvent extends Equatable {
//   const ThemeEvent();

//   @override
//   List<Object> get props => [];
// }

// class ThemeChangeEvent extends ThemeEvent {}

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ToggleThemeEvent extends ThemeEvent {}
