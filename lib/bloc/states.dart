
import 'package:hashka/bloc/events.dart';
import 'package:hashka/cryptography/hashing.dart';

/// wraps the hashed user input
class HashState {
  HashEvent event;
  String    hashedUserInput;

  HashState(this.event, this.hashedUserInput);

  HashState.initialState() {
      event           = HashEvent(Algorithm.NONE, "");
      hashedUserInput = "";
  }
}

enum SystemStates {
  NONE,
  CLIPBOARD_FILLED
}

/// abstraction for some aspect of the System having changed, e.g. clipboard has data
class SystemState {
  SystemStates systemState;
  String data;

  SystemState({this.systemState, this.data = ''});

  SystemState.initialState() {
    systemState = SystemStates.NONE;
  }
}
