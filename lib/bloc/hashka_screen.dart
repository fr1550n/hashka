import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';
import 'package:hashka/utils/utils.dart';

import 'blocs.dart';
import 'events.dart';

class HashkaScreen extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(title: Text('Hashka')),
        body: BlocBuilder<HashBloc, HashState>(builder: (context, state) {
          return Form(
              key: _formKey,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          child: Material(
                              color: Color(0xFFFFDB5A),
                              child: _renderHashState(state, context))),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_createUserInputField(controller)],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      _createButton(
                          context, Algorithm.MD5, 0xff008080, controller)
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      _createButton(
                          context, Algorithm.SHA_1, 0xff008080, controller)
                    ]),
                  ])));
        }));
  }

  Widget _renderHashState(HashState state, BuildContext ctx) {
      WidgetsBinding.instance.addPostFrameCallback((_){
        Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Copied! ${state.hashedUserInput}')));
      });
    return Text('${state.hashedUserInput}', style: TextStyle(fontSize: 24.0),);
  }

  Widget _createButton(BuildContext ctx, Algorithm algorithm, num colour,
      TextEditingController controller) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Color(colour),
        child: MaterialButton(
            minWidth: MediaQuery.of(ctx).size.width / 2,
            height: 100,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: Text(
              enumToString(algorithm),
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.7,
            ),
            onPressed: () {
              BlocProvider.of<HashBloc>(ctx)
                  .add(HashEvent(algorithm, controller.text));
              controller.clear();
            }));
  }
}

Widget _createUserInputField(TextEditingController controller) {
  return Expanded(
      child: TextFormField(
    controller: controller,
    decoration: const InputDecoration(
      hintText: "Enter text you'd like hashed here",
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  ));
}
