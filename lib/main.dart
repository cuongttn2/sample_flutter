import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/sample_cubit.dart';
import 'package:sample/sample_view.dart';
import 'package:sample/sync_fusion_chart.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleCubit(),
      child: BlocBuilder<SampleCubit, SampleState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChartView(
                      dataSource: [
                        ChartData('1', 1),
                        ChartData('2', 2),
                        ChartData('3', 1),
                        ChartData('4', 2),
                        ChartData('5', 1),
                        ChartData('6', 2),
                        ChartData('7', 2),
                      ],
                      maxY: 4,
                      minY: 0,
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavyBar(
                  selectedIndex: state.value1,
                  showElevation: true,
                  itemCornerRadius: 24,
                  curve: Curves.easeIn,
                  onItemSelected: (index) =>
                      BlocProvider.of<SampleCubit>(context)
                          .onChangeContentEvent(
                              value1: index, value2: 'indexValue'),
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                      icon: const Icon(Icons.apps),
                      title: const Text('Home'),
                      activeColor: Colors.red,
                      textAlign: TextAlign.center,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.people),
                      title: const Text('Users'),
                      activeColor: Colors.purpleAccent,
                      textAlign: TextAlign.center,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.message),
                      title: const Text(
                        'Messages test for mes teset test test ',
                      ),
                      activeColor: Colors.pink,
                      textAlign: TextAlign.center,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      activeColor: Colors.blue,
                      textAlign: TextAlign.center,
                    ),
                    // This trailing comma makes auto-formatting nicer for build methods.
                  ]));
        },
      ),
    );
  }
}
