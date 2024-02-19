
part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];

  factory CounterState.initialState() {
    return const CounterState(counter: 0);
  }

  CounterState copyWith(int? incrementValue) {
    return CounterState(counter: incrementValue ?? counter);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
    );
  }

}
