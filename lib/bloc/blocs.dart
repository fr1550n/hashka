import 'package:bloc/bloc.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:hashka/bloc/states.dart';
import 'package:hashka/cryptography/hashing.dart';

import 'events.dart';

/// receives HashEvent and outputs HashState
class HashBloc extends Bloc<HashEvent, HashState> {
  HashBloc() : super(HashState.initialState());

  @override
  Stream<HashState> mapEventToState(HashEvent event) async* {
       final hash = Hasher(event.algorithm).hash(event.userInput);
       copyToClipboard(hash);
       yield HashState(event, hash);
  }

  void copyToClipboard(String hash) {
    ClipboardManager.copyToClipBoard(hash);
  }
}
