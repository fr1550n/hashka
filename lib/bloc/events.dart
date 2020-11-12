import 'package:equatable/equatable.dart';
import 'package:hashka/cryptography/hashing.dart';

class HashEvent extends Equatable {
   final Algorithm algorithm;
   final String    userInput;

   HashEvent(this.algorithm, this.userInput);

  @override
  List<Object> get props => [ algorithm, userInput ];
}

class SystemEvent {
   final String hashedUserInput;
   SystemEvent(this.hashedUserInput);
}
