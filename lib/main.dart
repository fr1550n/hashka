import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';
import 'bloc/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _blocCounterPage()
      /// home: _standardCounterPage()
    );
  }

  Widget _blocCounterPage() => BlocProvider(create: (context) => CounterBloc(),
                                            child:  CounterPage());
}
