import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs.dart';
import 'ui/hashka_screen.dart';

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
      home: _hashPage()
    );
  }

  Widget _hashPage() {
    // ignore: close_sinks
    final hashBloc = HashBloc();
    return MultiBlocProvider(providers: [ BlocProvider(create: (context) => hashBloc),
                                          BlocProvider(create: (context) => SystemEventBloc(hashBloc)), ],
                             child: HashkaScreen());
  }
}