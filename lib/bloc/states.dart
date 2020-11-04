
import 'package:hashka/bloc/events.dart';
import 'package:hashka/cryptography/hashing.dart';

class HashState{
  HashEvent event;
  String    hashedUserInput;

  HashState(this.event, this.hashedUserInput);

  HashState.initialState() {
      event           = HashEvent(Algorithm.NONE, "");
      hashedUserInput = "";
  }

}