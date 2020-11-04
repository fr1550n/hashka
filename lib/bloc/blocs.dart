import 'package:bloc/bloc.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';

import 'events.dart';
/// receives HashEvent and outputs HashState
class HashBloc extends Bloc<HashEvent, HashState> {
  HashBloc() : super(HashState.initialState());

  @override
  Stream<HashState> mapEventToState(HashEvent event) async* {
    switch (event.algorithm) {
      case Algorithm.MD5:
        yield HashState(event,
                       Hasher(event.algorithm).hash(event.userInput));
        break;
      case  Algorithm.SHA_1:
        yield HashState(event,
                        Hasher(event.algorithm).hash(event.userInput));
        break;
    }
  }
}

