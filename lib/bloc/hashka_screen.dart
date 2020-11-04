import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';

import 'blocs.dart';
import 'events.dart';

class HashkaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Hashka')),
      body: BlocBuilder<HashBloc, HashState>(
        builder: (context, state) {
          return Center(
            child: Text(
              '${state.hashedUserInput}',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Text("MD5"),
              onPressed: () {
                BlocProvider.of<HashBloc>(context).add(HashEvent(Algorithm.MD5, "hello"));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Text("SHA-1"),
              onPressed: () {
                BlocProvider.of<HashBloc>(context).add(HashEvent(Algorithm.SHA_1, "hello"));
              },
            ),
          ),
        ],
      ),
    );
  }
}