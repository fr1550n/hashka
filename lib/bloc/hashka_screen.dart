import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';
import 'package:hashka/utils/utils.dart';

import 'blocs.dart';
import 'events.dart';

class HashkaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hashka')),
        body: BlocBuilder<HashBloc, HashState>(builder: (context, state) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_createHashResultDisplay(state)]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_createButton(context, Algorithm.MD5)]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_createButton(context, Algorithm.SHA_1)]),
              ]));
        }));
  }

  Widget _createHashResultDisplay(HashState state) {
    return Expanded(child:Text(
      '${state.hashedUserInput}',
      style: TextStyle(fontSize: 24.0),
    ));
  }

  Widget _createButton(BuildContext ctx, Algorithm algorithm) {
    return MaterialButton(
        child: Text(enumToString(algorithm)),
        onPressed: () {
          BlocProvider.of<HashBloc>(ctx).add(HashEvent(algorithm, "hello"));
        });
  }
}
