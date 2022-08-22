import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/sample_cubit.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SampleCubit, SampleState>(
      builder: (context, state) {
        return Scaffold(
            appBar: _appBar(context),
            body: RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<SampleCubit>(context)
                    .onChangeContentEvent(
                    value1: '1',
                    value2: '2');
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: BlocBuilder<SampleCubit, SampleState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Text(state.value1.toString()),
                        ),
                        SizedBox(
                          height: 400,
                          child: Text(state.value2!),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ));
      },
    );
  }

  AppBar _appBar(context) {
    return AppBar();
  }
}
