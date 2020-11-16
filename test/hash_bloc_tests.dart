import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:hashka/bloc/blocs.dart';
import 'package:hashka/bloc/events.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';
import 'package:test/test.dart';

void main() {
  group('HashBloc', () {

    // ignore: close_sinks
    HashBloc hashBloc;

    final initialState = HashState.initialState();
    final e1 = HashEvent(Algorithm.SHA_1, "hello");
    final e2 = HashEvent(Algorithm.SHA_1, "darkness");
    final e3 = HashEvent(Algorithm.SHA_1, "my old friend");
    final s1 = HashState(e1, "aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d");
    final s2 = HashState(e2, "60eb7e5f19f749bff6c73caea6de7fb0b54f27f8");
    final s3 = HashState(e3, "2dc01feae44ce49a4bca122d6c485a8cae8ffb36");
    final List<HashEvent> events = [ e1, e2, e3 ];
    final List<HashState> states = [ s1, s2, s3 ];

    setUp(() {
      hashBloc = HashBloc();
    });

    test("verify the bloc's initial state", () {
      expect(hashBloc.state, initialState);
    });

    blocTest(
      'bloc emits nothing by default',
      build: () => hashBloc,
      expect: [],
    );

    blocTest(
      'hash events leads to the appropriate hashed states',
      build: () => hashBloc,
      act: (bloc) => bloc..add(e1)..add(e2)..add(e3),
      expect: states
    );

    test("mock the bloc as if it were a collaborator?!", () {
      final mock = MockHashBloc();
      whenListen<HashState>(mock, Stream.fromIterable(states));
      expectLater(mock, emitsInOrder(states));
      // assumes our bloc retains the last state emitted // expect(mock.state, equals(s3));
    });
  });
}

class MockHashBloc extends MockBloc<HashState> implements HashBloc {}
