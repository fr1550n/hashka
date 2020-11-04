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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFDB5A),
                          child: _createHashResultDisplay(state)))
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _createButton(context, Algorithm.MD5, 0xFF54422E)
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _createButton(context, Algorithm.SHA_1, 0xff01A0C7)
                ]),
              ]));
        }));
  }

  Widget _createHashResultDisplay(HashState state) {
    return Text(
      '${state.hashedUserInput}',
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget _createButton(BuildContext ctx, Algorithm algorithm, num colour) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Color(colour),
        child: MaterialButton(
            minWidth: MediaQuery.of(ctx).size.width / 2,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: Text(enumToString(algorithm)),
            onPressed: () {
              BlocProvider.of<HashBloc>(ctx).add(HashEvent(algorithm, "hello"));
            }));
  }
}
