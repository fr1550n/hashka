
import 'package:equatable/equatable.dart';
import 'package:hashka/bloc/events.dart';
import 'package:hashka/cryptography/hashing.dart';

/// wraps the hashed user input
class HashState extends Equatable {
  final HashEvent event;
  final String    hashedUserInput;

  HashState(this.event, this.hashedUserInput);

  /// named constructor with final fields ftw!
  HashState.initialState():
    event           = HashEvent(Algorithm.NONE, ""),
    hashedUserInput = "";


  @override
  List<Object> get props => [ event, hashedUserInput ];
}

enum SystemStates {
  NONE,
  CLIPBOARD_FILLED
}

/// abstraction for some aspect of the System having changed, e.g. clipboard has data
class SystemState {
  final SystemStates systemState;
  final String data;

  SystemState(this.systemState, this.data);

  SystemState.initialState():
        systemState = SystemStates.NONE,
        data = '';

}
