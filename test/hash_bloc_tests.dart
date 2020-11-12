import 'package:flutter/cupertino.dart';
import 'package:hashka/bloc/blocs.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';
import 'package:test/test.dart';

void main() {
  group('HashBloc', () {
    HashBloc hashBloc;

    setUp(() {
      hashBloc = HashBloc();
    });

    test('initial state', () {
      var initialState = HashState.initialState();
      expect(hashBloc.state, initialState);
    });
  });
}