import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs.dart';
import 'events.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //nope: final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    // ignore: close_sinks
    //nope:  final CounterBloc counterBloc = CounterBloc();

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
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
              child: Icon(Icons.add),
              onPressed: () {
                //nope:  counterBloc.add(CounterEvent.increment);
                BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                //nope:  counterBloc.add(CounterEvent.decrement);
                BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}