import 'package:hashka/cryptography/hashing.dart';

class HashEvent {
   Algorithm algorithm;
   String    userInput;
   HashEvent(this.algorithm, this.userInput);
}
