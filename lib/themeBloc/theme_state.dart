part of 'theme_bloc.dart';

enum ThemeType {
  light,
  dark;

  String toJson() => name;
  static ThemeType fromJson(String json) => values.byName(json);
  // static ThemeType fromJson(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final ThemeType? themeType;
  const ThemeState({this.themeType = ThemeType.light});

  @override
  List<Object> get props => [themeType!];

  factory ThemeState.initialState() {
    return const ThemeState();
  }

  @override
  String toString() => 'Current ThemeState(appTheme: $themeType)';
  ThemeState copyWith({ThemeType? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({"themeType": themeType?.toJson()});
    return result;
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      themeType: json['themeType'] != null
          ? ThemeType.fromJson(json["themeType"])
          : null,
    );
  }
}

// part of 'theme_bloc.dart';

// enum AppTheme {
//   light,
//   dark;

//   String toJson() => name;

//   static AppTheme fromJson(String json) => values.byName(json);
// }

// final class ThemeState extends Equatable {
//   const ThemeState({
//     this.appTheme = AppTheme.light,
//   });

//   factory ThemeState.initial() {
//     return const ThemeState();
//   }

//   final AppTheme appTheme;

//   @override
//   List<Object> get props => [appTheme];

//   @override
//   String toString() => 'ThemeState(appTheme: $appTheme)';

//   ThemeState copyWith({
//     AppTheme? appTheme,
//   }) {
//     return ThemeState(
//       appTheme: appTheme ?? this.appTheme,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final result = <String, dynamic>{};

//     result.addAll({'appTheme': appTheme.toJson()});

//     return result;
//   }

//   factory ThemeState.fromJson(Map<String, dynamic> json) {
//     return ThemeState(
//       appTheme: AppTheme.fromJson(json['appTheme']),
//     );
//   }
// }
