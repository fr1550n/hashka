import 'package:crypto/crypto.dart';
import 'dart:convert';

enum Algorithm {
  NONE,
  MD5,
  SHA_1,
}

class Hasher {
  Algorithm algorithm;
  Hasher(this.algorithm);

  String hash(String input) {
    var bytes = utf8.encode(input);
    switch (algorithm) {
      case Algorithm.SHA_1:
        return sha1.convert(bytes).toString();
      case Algorithm.MD5:
        return md5.convert(bytes).toString();
      default:
        throw Exception("Unknown algorithm: $algorithm");
    }
  }
}
