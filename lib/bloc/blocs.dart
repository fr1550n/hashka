import 'dart:developer' as developer;
import 'dart:async';

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
       yield HashState(event, hash);
  }
}
/// https://bloclibrary.dev/#/architecture?id=bloc-to-bloc-communication
/// listens for HashState and converts them into SystemEvents
/// receives SystemEvent and outputs SystemState
/// e.g. to reflect that we've copied some data to the system's clipboard
class SystemEventBloc extends Bloc<SystemEvent, SystemState> {

  final HashBloc hashBloc;
  StreamSubscription hashBlocSubscription;

  SystemEventBloc(this.hashBloc) : super(SystemState.initialState()) {
    hashBlocSubscription = hashBloc.listen((state) {
      developer.log("SystemEventBloc received state: $state");
      add(SystemEvent(state.hashedUserInput));
    });
  }

  @override
  Stream<SystemState> mapEventToState(event) async* {
    copyToClipboard(event.hashedUserInput);
    yield SystemState(SystemStates.CLIPBOARD_FILLED, event.hashedUserInput);
  }

  void copyToClipboard(String hash) {
    ClipboardManager.copyToClipBoard(hash);
  }

  @override
  Future<void> close() {
    hashBlocSubscription.cancel();
    return super.close();
  }
}