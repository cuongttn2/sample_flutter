part of 'sample_cubit.dart';



class SampleState {
  final int? value1;
  final String? value2;

  const SampleState({
    this.value1,
    this.value2,
  });

  SampleState copyWith({
    int? value1,
    String? value2,
  }) {
    return SampleState(
      value1: value1 ?? this.value1,
      value2: value2 ?? this.value2,
    );
  }
}
