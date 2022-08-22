import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  //final SampleRepository sampleRepo;

  SampleCubit(
      //{required this.sampleRepo,}
      )
      : super(const SampleState());

  FutureOr<void> onChangeContentEvent({
    required value1,
    required value2,
  }) async {
    emit(state.copyWith(
      value1: value1,
      value2: value2,
    ));
  }
}
