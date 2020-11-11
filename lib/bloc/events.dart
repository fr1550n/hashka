import 'package:hashka/cryptography/hashing.dart';

class HashEvent {
   Algorithm algorithm;
   String    userInput;
   HashEvent(this.algorithm, this.userInput);
}

class SystemEvent {
   String hashedUserInput;
   SystemEvent(this.hashedUserInput);
}
